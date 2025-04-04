//
//  PersonMinorForm.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 03/04/25.
//

import SwiftUI

struct PersonMinorForm: View {
    
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
                VStack {
                    HStack(spacing: 2) {
                        TextComponent(text: "Fotografia", style: .body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.grey500)
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150)
                        .foregroundStyle(.grey500, .grey50)
                        .shadow(color: .black.opacity(0.25), radius: 2, y: 5)
                }

               
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
                
                FieldComponent(type: .textField, name: "Nacionalidad", placeholder: "Seleccione la nacionalidad", text: .constant(""),isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Estado Civil", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true,  fontSize: .body)
                
                FieldComponent(type: .textField, name: "Fecha de Nacimiento", placeholder: "Ingrese la fecha de nacimiento", text: .constant(""), isRequired: true,  fontSize: .body)
                
                FieldComponent(type: .textField, name: "¿Sabe leer o escribir?", placeholder: "Sí No", text: .constant(""), isRequired: true,  fontSize: .body)
                
                FieldComponent(type: .textField, name: "¿Está embarazada?", placeholder: "Sí No", text: .constant(""), isRequired: true,  fontSize: .body)
                
                FieldComponent(type: .textField, name: "Meses de Emabrazo", placeholder: "Ingrese los meses de embarazo", text: .constant(""), fontSize: .body)
                
                FieldComponent(type: .textField, name: "RFC", placeholder: "Ingrese el RFC", text: .constant(""), fontSize: .body)
                
                FieldComponent(type: .textField, name: "Escolaridad", placeholder: "Seleccione una opción", text: .constant(""), fontSize: .body)
                
            }
        }
    }
}

#Preview {
    PersonMinorForm()
}

