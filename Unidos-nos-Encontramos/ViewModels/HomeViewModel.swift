//
//  HomeViewModel.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import CoreLocation
import Combine

class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var userLocation: CLLocation? // Aquí almacenaremos la ubicación del usuario
    @Published var userAddress: String = "" // Aquí almacenaremos la dirección
    @Published var route: RouteResponse?

    private var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func createRoute(userId: UUID, route: Route) async throws {
        do {
            let data = try await ApiService.consume(body: route, method: .post, endpoint: "\(baseURL)/routes?userId\(userId)")
            
            let decoder = JSONDecoder()
            
            let dataUrl = try decoder.decode(RouteResponse.self, from: data)
            
            self.route = dataUrl
        } catch {
            print("no se pudo")
        }
    }

    // Convertir coordenadas en una dirección legible
    func reverseGeocodeLocation(location: CLLocation) {
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            if let error = error {
                print("Error in reverse geocoding: \(error.localizedDescription)")
                return
            }

            if let placemark = placemarks?.first {
                self?.userAddress = self?.formatAddress(placemark: placemark) ?? "Unknown Address"
            }
        }
    }

    // Función auxiliar para formatear la dirección
    private func formatAddress(placemark: CLPlacemark) -> String {
        var addressString = ""
        
        if let street = placemark.thoroughfare {
            addressString += street
        }
        if let city = placemark.locality {
            addressString += ", \(city)"
        }
        if let state = placemark.administrativeArea {
            addressString += ", \(state)"
        }
        if let postalCode = placemark.postalCode {
            addressString += " \(postalCode)"
        }

        return addressString
    }

    // Delegado de CLLocationManager
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
        reverseGeocodeLocation(location: location) // Realiza el reverse geocoding
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get user's location: \(error.localizedDescription)")
    }
}
