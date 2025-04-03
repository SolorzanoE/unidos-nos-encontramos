//
//  Unidos_nos_EncontramosApp.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 23/03/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    let notificationService = NotificationService()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        UNUserNotificationCenter.current().delegate = self
        return true
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        
        NotificationCenter.default.post(
            name: Notification.Name("NotificationTapped"),
            object: nil,
            userInfo: userInfo
        )
        
        completionHandler()
    }
}

@main
struct Unidos_nos_EncontramosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var loginViewModel = LoginViewModel()
    
    @Environment(\.scenePhase) var scenePhase
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(loginViewModel)
                .environmentObject(delegate.notificationService)
                .onChange(of: scenePhase) { newPhase in
                    switch newPhase {
                    case .active:
                        if let userId = loginViewModel.user?.id {
                            delegate.notificationService.startPolling(for: userId)
                        }
                    case .background:
                        delegate.notificationService.stopPolling()
                    case .inactive:
                        break
                    @unknown default:
                        break
                    }
                }
                .onChange(of: loginViewModel.user) { newUser in
                    if let userId = newUser?.id {
                        print("User logged in with ID: \(userId), starting notifications")
                        delegate.notificationService.startPolling(for: userId)
                    } else {
                        print("User logged out, stopping notifications")
                        delegate.notificationService.stopPolling()
                    }
                }
        }
    }
}
