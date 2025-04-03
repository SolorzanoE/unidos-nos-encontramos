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
    
    @State private var isPresented: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            Map(position: $position) {
                
                
            }.mapStyle(.standard(pointsOfInterest: .excludingAll))
            
            HStack {
                JourneyButtonComponent(text: "Iniciar Trayecto") {
                    isPresented.toggle()
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "exclamationmark.triangle.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white500)
                        .frame(maxWidth: 35)
                }.frame(maxWidth: 45, maxHeight: 45)
                    .padding()
                    .background(.yellow600)
                    .clipShape(Circle())
            }.padding(.horizontal)
        }.sheet(isPresented: $isPresented) {
            CheckTrayect()
                .presentationDetents([.fraction(0.8)])
                .presentationDragIndicator(.visible)
                .presentationCornerRadius(25)
        }
    }
}

#Preview {
    HomeView()
}
