//
//  CheckTrayect.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 02/04/25.
//

import SwiftUI
import CoreLocation

struct CheckTrayect: View {
    
    @State private var finalUbication: String = ""
    @State private var contacts: String = ""
    @State private var time: String = ""
    @State private var photo: String = ""
    @StateObject private var homeViewModel = HomeViewModel()
    @EnvironmentObject private var loginVM: LoginViewModel
    
    var body: some View {
        
        VStack(spacing: 17) {
            
            FieldComponent(type: .textField, name: "Tu ubicación actual", placeholder: "Tu ubicación", text: .constant(homeViewModel.userAddress), isRequired: true)
                .disabled(true)
            
            FieldComponent(type: .textField, name: "Tu lugar de destino", placeholder: "Seleccione su lugar de destino", text: $finalUbication, isRequired: true)
                .disabled(true)
            
            FieldComponent(type: .textField, name: "Contactos a notificar", placeholder: "Seleccione a sus contactos", text: $contacts, isRequired: true)
            
            FieldComponent(type: .textField, name: "Establecer intervalo de tiempo", placeholder: "Selecciona el tiempo", text: $time, isRequired: true)
            
            FieldComponent(type: .textField, name: "Fotos (Opcional)", placeholder: "Añadir fotografias antes del trayecto", text: $photo)
            
            Spacer()
            
            JourneyButtonComponent(text: "Confirmar Trayecto") {
                Task {
                   try await homeViewModel.createRoute(
                        userId: loginVM.user!.id,
                        route: Route(
                            startLat: 0, startLng: 0, endLat: 10,
                            estimatedArrivalTime: nil,
                            suspiciousThreshold: 15,
                            arrivalRadiusMeters: 10,
                            contacts: [
                                .init(userId: .init(), notificationInterval: 10)
                            ]
                        )
                    )
                }
            }
            
        }.padding(.horizontal)
            .padding(.top, 30)
            .background(BackgroundComponent(style: .white))
    }
}

#Preview {
    CheckTrayect()
        .environmentObject(LoginViewModel())
}
