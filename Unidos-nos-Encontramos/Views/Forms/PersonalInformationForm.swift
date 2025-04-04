//
//  PersonalInformationForm.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 02/04/25.
//

import SwiftUI

struct PersonalInformationForm: View {
    
    @State private var firstName: String = ""
    @State private var paternaLastName: String = ""
    @State private var maternaLastName: String = ""
    @State private var Nationality: String = ""
    @State private var DateOfBirth: String = ""
    @State private var PlaceOfBirth: String = ""
    @State private var sex: String = ""
    @State private var gender: String = ""
    @State private var curp: String = ""
    
    var body: some View {
        
        ZStack {
            
            BackgroundComponent(style: .white)
            
            VStack(spacing: 17) {
                
                FieldComponent(type: .textField, name: "Nombre", placeholder: "Ingrese su nombre", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Apellido Paterno", placeholder: "Ingrese su apellido paterno", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Apellido Materno", placeholder: "Ingrese su apellido materno", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Nacionalidad", placeholder: "Seleccione su nacionalidad", text: .constant(""),isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Fecha de Nacimiento", placeholder: "Ingrese su fecha de nacimiento", text: .constant(""), isRequired: true,  fontSize: .body)
                
                
                VStack(alignment: .leading, spacing: 2) {
                    
                    HStack(spacing: 2) {
                        TextComponent(text: "Lugar de Nacimiento", style: .body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.grey500)
                        
                        TextComponent(text: "*", style: .body)
                            .foregroundStyle(.red400)
                            .fontWeight(.semibold)
                    }
                    
                    HStack {
                        FieldComponent(type: .textField, placeholder: "Seleccione un estado", text: .constant(""), isRequired: true,  fontSize: .body)
                        
                        FieldComponent(type: .textField, placeholder: "Seleccione una ciudad", text: .constant(""), isRequired: true,  fontSize: .body)
                    }
                }
                
                HStack {
                    FieldComponent(type: .textField, name: "Sexo", placeholder: "Seleccione su sexo", text: .constant(""), isRequired: true, fontSize: .body)
                    
                    FieldComponent(type: .textField, name: "Género", placeholder: "Seleccione su género", text: .constant(""), isRequired: true, fontSize: .body)
                }
                
                FieldComponent(type: .textField, name: "CURP (Clave Única de Registro de Población)", placeholder: "Ingrese su CURP", text: .constant(""), fontSize: .body)
            }
        }
    }
}

#Preview {
    PersonalInformationForm()
}
