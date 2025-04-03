//
//  SearchLocationView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import MapKit
import SwiftUI

struct SearchLocationView: View {
    @State private var selectedCoordinate: CLLocationCoordinate2D?
    @State private var position: MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        ZStack(alignment: .top) {
            MapReader { reader in
                Map(position: $position) {
                    // Marcador para la ubicación seleccionada
                    if let selectedCoordinate {
                        Annotation("Ubicación seleccionada", coordinate: selectedCoordinate) {
                            Image(systemName: "mappin.circle.fill")
                                .foregroundStyle(.red)
                                .font(.title)
                        }
                    }
                }
                .onTapGesture { location in
                    // Convertir el punto tocado a coordenadas geográficas
                    if let coordinate = reader.convert(location, from: .local) {
                        selectedCoordinate = coordinate
                        print("Coordenadas guardadas: \(coordinate.latitude), \(coordinate.longitude)")
                    }
                }
                .mapControls {
                    // Opcional: Mostrar botón de ubicación actual
                    MapUserLocationButton()
                }
            }
            
            VStack {
                SearchComponent(text: .constant(""), placeholder: "Buscar...")
                    
                Spacer()
                
                JourneyButtonComponent(text: "Aceptar")
            }.padding(.horizontal)
        }
    }
}

#Preview {
    SearchLocationView()
}
