//
//  NotificationService.swift
//  Unidos-nos-Encontramos
//
//  Created by macbook on 03/04/25.
//

import Foundation
import UserNotifications
import SwiftUI
import Combine

class NotificationService: ObservableObject {
    @Published var unreadCount: Int = 0
    @Published var recentNotifications: [NotificationResponse] = []
    
    private var timer: Timer?
    private var lastFetchTimestamp: Date
    private let pollingInterval: TimeInterval = 10.0
    private var userId: UUID?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        lastFetchTimestamp = UserDefaults.standard.object(forKey: "lastNotificationFetch") as? Date ?? Date().addingTimeInterval(-86400)
        
        configureNotifications()
    }
    
    func configureNotifications() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notificaciones autorizadas")
            } else if let error = error {
                print("Error al solicitar autorización: \(error.localizedDescription)")
            }
        }
    }
    
    func suggestEnablingNotificationsInSettings() {
        DispatchQueue.main.async {
            if let scene = UIApplication.shared.connectedScenes.first,
               let windowScene = scene as? UIWindowScene,
               let rootViewController = windowScene.windows.first?.rootViewController {
                
                let alertController = UIAlertController(
                    title: "Notificaciones Desactivadas",
                    message: "Para recibir alertas sobre rutas y reportes, activa las notificaciones en Configuración.",
                    preferredStyle: .alert
                )
                
                alertController.addAction(UIAlertAction(title: "Ignorar", style: .cancel))
                
                alertController.addAction(UIAlertAction(title: "Configuración", style: .default) { _ in
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        UIApplication.shared.open(url)
                    }
                })
                
                rootViewController.present(alertController, animated: true)
            }
        }
    }
    
    func startPolling(for userId: UUID) {
        self.userId = userId
        stopPolling() // Detener cualquier timer existente
        
        // Iniciar nuevo timer
        timer = Timer.scheduledTimer(withTimeInterval: pollingInterval, repeats: true) { [weak self] _ in
            self?.fetchNewNotifications()
        }
        
        // Forzar una primera ejecución inmediata
        fetchNewNotifications()
        
        // Asegurar que el timer sigue funcionando incluso cuando se hace scroll
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    func stopPolling() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateLastFetchTimestamp() {
        lastFetchTimestamp = Date()
        UserDefaults.standard.set(lastFetchTimestamp, forKey: "lastNotificationFetch")
    }
    
    func fetchNewNotifications() {
        guard let userId = userId else { return }
        
        // Formatear fecha para la API
        let dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime]
        let formattedDate = dateFormatter.string(from: lastFetchTimestamp)
        
        Task {
            do {
                let endpoint = "\(baseURL)/notifications/new/\(userId)?since=\(formattedDate)"
                
                let data = try await ApiService.consume(
                    body: nil as String?,
                    method: .get,
                    endpoint: endpoint
                )
                
                // Decodificar respuesta
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let notifications = try decoder.decode([NotificationResponse].self, from: data)
                
                // Actualizar en el hilo principal
                await MainActor.run {
                    // Actualizar contador de no leídas
                    self.unreadCount = notifications.count
                    
                    // Añadir a notificaciones recientes
                    self.recentNotifications = notifications
                    
                    // Mostrar notificaciones locales
                    self.showLocalNotifications(for: notifications)
                    
                    // Actualizar timestamp solo si la petición fue exitosa
                    self.updateLastFetchTimestamp()
                }
            } catch {
                print("Error al obtener notificaciones: \(error.localizedDescription)")
            }
        }
    }
    
    private func registerNotificationCategories() {
        // Crear acciones para notificaciones de rutas
        let viewRouteAction = UNNotificationAction(
            identifier: "VIEW_ROUTE",
            title: "Ver ruta",
            options: .foreground
        )
        
        let routeCategory = UNNotificationCategory(
            identifier: "ROUTE_CHECK",
            actions: [viewRouteAction],
            intentIdentifiers: [],
            options: []
        )
        
        // Crear acciones para notificaciones de reportes
        let viewReportAction = UNNotificationAction(
            identifier: "VIEW_REPORT",
            title: "Ver reporte",
            options: .foreground
        )
        
        let reportCategory = UNNotificationCategory(
            identifier: "MISSING_REPORT",
            actions: [viewReportAction],
            intentIdentifiers: [],
            options: []
        )
        
        // Registrar las categorías
        UNUserNotificationCenter.current().setNotificationCategories([routeCategory, reportCategory])
    }
    
    func showLocalNotifications(for notifications: [NotificationResponse]) {
        let center = UNUserNotificationCenter.current()
        
        for notification in notifications {
            let content = UNMutableNotificationContent()
            content.title = getTitleForType(notification.type)
            content.body = notification.message
            content.sound = UNNotificationSound.default
            
            // Determinar la categoría para acciones
            content.categoryIdentifier = notification.type.rawValue
            
            // Añadir datos para cuando el usuario toque la notificación
            if let reportId = notification.relatedReportId {
                content.userInfo["reportId"] = reportId.uuidString
            }
            
            if let routeId = notification.relatedRouteId {
                content.userInfo["routeId"] = routeId.uuidString
            }
            
            content.userInfo["notificationId"] = notification.id.uuidString
            content.userInfo["type"] = notification.type.rawValue
            
            // Crear request con identificador único
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
            let request = UNNotificationRequest(
                identifier: "notification-\(notification.id.uuidString)",
                content: content,
                trigger: trigger
            )
            
            // Añadir la notificación al centro de notificaciones
            center.add(request) { error in
                if let error = error {
                    print("Error al mostrar notificación: \(error.localizedDescription)")
                }
            }
            
            // Marcar como leída en el servidor en background
            markAsRead(notificationId: notification.id)
        }
    }
    
    func markAsRead(notificationId: UUID) {
        Task {
            do {
                let endpoint = "\(baseURL)/notifications/\(notificationId)/read"
                
                _ = try await ApiService.consume(
                    body: nil as String?,
                    method: .post,
                    endpoint: endpoint
                )
            } catch {
                print("Error al marcar notificación como leída: \(error.localizedDescription)")
            }
        }
    }
    
    private func getTitleForType(_ type: NotificationResponse.NotificationType) -> String {
        switch type {
        case .ROUTE_INFO:
            return "Información de Ruta"
        case .ROUTE_CHECK:
            return "Verificación de Ruta"
        case .MISSING_REPORT:
            return "Reporte de Persona Desaparecida"
        case .CONTACT_REQUEST:
            return "Solicitud de Contacto"
        case .SAFETY_CONFIRMATION:
            return "Confirmación de Seguridad"
        }
    }
    
    func loadNotificationHistory() async {
        guard let userId = userId else { return }
        
        do {
            let endpoint = "\(baseURL)/notifications/history/\(userId)?size=20"
            
            let data = try await ApiService.consume(
                body: nil as String?,
                method: .get,
                endpoint: endpoint
            )
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            
            let response = try decoder.decode(PagedResponse<NotificationResponse>.self, from: data)
            
            await MainActor.run {
                
            }
        } catch {
            print("Error cargando historial de notificaciones: \(error.localizedDescription)")
        }
    }
    
    
}
