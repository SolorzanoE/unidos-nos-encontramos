//
//  ContactInformationForm.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//


import SwiftUI

struct ContactInformationForm: View {
    
    @State private var cellphone: String = ""
    @State private var email: String = ""
    @State private var address: String = ""
    
    var body: some View {
        
        ZStack {
            
            BackgroundComponent(style: .white)
            
            VStack(spacing: 17) {
                
                FieldComponent(type: .textField, name: "Número de Telefono", placeholder: "Ingrese su número de telefono", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Correo Electrónico", placeholder: "Ingrese su correo electrónico", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Dirección", placeholder: "Ingrese su dirección", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, placeholder: "Seleccione un estado", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, placeholder: "Seleccione un municipio", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, placeholder: "Ingrese su código postal", text: .constant(""), isRequired: true, fontSize: .body)

            }
        }
    }
}

#Preview {
    ContactInformationForm()
}
