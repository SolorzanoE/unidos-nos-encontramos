//
//  PhysicalCharacteristicsForm.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import SwiftUI

struct PhysicalCharacteristicsForm: View {
    
    @State private var cellphone: String = ""
    @State private var email: String = ""
    @State private var address: String = ""
    
    var body: some View {
        
        ZStack {
            
            BackgroundComponent(style: .white)
            
            VStack(spacing: 17) {
                
                FieldComponent(type: .textField, name: "Estatura (cm)", placeholder: "Ingresa tu estatura", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Peso Corporal (Kg)", placeholder: "Ingrese su peso", text: .constant(""), fontSize: .body)
                
                FieldComponent(type: .textField, name: "Color de Ojos", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Color de Piel", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Complexión", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Tipo de Cabello", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body)
                
                VStack(alignment: .leading, spacing: 7) {
                    HStack(spacing: 2) {
                        TextComponent(text: "Señas Particulares", style: .body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.grey500)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    Checks(name: "Cicatrices")
                    
                    Checks(name: "Tatuajes")
                    
                    Checks(name: "Piercings")
                    
                    Checks(name: "Lunares")
                }
            }
        }
    }
}

private struct Checks: View {
    
    let name: String
    
    var body: some View {
        HStack {
            TextComponent(text: name, style: .body)
                .foregroundStyle(.grey500)
                .frame(width: 80, alignment: .leading)
                .padding(.trailing)
            
            RoundedRectangle(cornerRadius: 2)
                .stroke()
                .foregroundStyle(.grey400)
                .frame(width: 18, height: 18)
        }
    }
}

#Preview {
    PhysicalCharacteristicsForm()
}
