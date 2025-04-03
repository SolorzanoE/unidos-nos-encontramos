//
//  HomeView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 27/03/25.
//

import SwiftUI
import MapKit

struct HomeView: View {
    @State private var position: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 19.4326, longitude: -99.1332), // CDMX
            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        )
    )
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Map(position: $position) {
                
                
            }.mapStyle(.standard(pointsOfInterest: .excludingAll))
            
            
        }
    }
}

#Preview {
    HomeView()
}
