//
//  CheckTrayect.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 02/04/25.
//

import SwiftUI
import CoreLocation

struct CheckTrayect: View {
    
    @State private var currentLocate: CLLocationCoordinate2D = .init(latitude: 0, longitude: 0)
    @State private var destination: CLLocationCoordinate2D = .init(latitude: 0, longitude: 0)
    
    @State private var currentUbication: String = ""
    @State private var finalUbication: String = ""
    @State private var contacts: String = ""
    @State private var time: String = ""
    @State private var photo: String = ""
    
    var body: some View {
        
        VStack(spacing: 17) {
            
            FieldComponent(type: .textField, name: "Tu ubicación actual", placeholder: "Tu ubicación", text: $currentUbication, isRequired: true)
            
            FieldComponent(type: .textField, name: "Tu lugar de destino", placeholder: "Seleccione su lugar de destino", text: $finalUbication, isRequired: true)
                .disabled(true)
            
            FieldComponent(type: .textField, name: "Contactos a notificar", placeholder: "Seleccione a sus contactos", text: $contacts, isRequired: true)
            
            FieldComponent(type: .textField, name: "Establecer intervalo de tiempo", placeholder: "Selecciona el tiempo", text: $time, isRequired: true)
            
            FieldComponent(type: .textField, name: "Fotos (Opcional)", placeholder: "Añadir fotografias antes del trayecto", text: $photo, isRequired: true)
            
            Spacer()
            
            JourneyButtonComponent(text: "Confirmar Trayecto")
                
        }.padding(.horizontal)
            .padding(.top, 30)
            .background(BackgroundComponent(style: .white))
    }
}

#Preview {
    CheckTrayect()
}
