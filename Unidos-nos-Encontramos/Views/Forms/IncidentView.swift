//
//  IncidentView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import SwiftUI
import MapKit

struct IncidentView: View {
    
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
                
                FieldComponent(type: .textField, name: "Tipo de Domicilio", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Calle", placeholder: "Ingrese la calle", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Número Exterior", placeholder: "Ingrese el número exterior", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Número Interior", placeholder: "Ingrese el número interior", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Entre Calles", placeholder: "Ingrese la calle", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Estado", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Municipio o Alcaldía", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Colonia", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Código Postal", placeholder: "Ingrese el código postal", text: .constant(""), isRequired: true, fontSize: .body)
                
                VStack(alignment: .leading, spacing: 2) {
                    
                    HStack(spacing: 2) {
                        TextComponent(text: "Referencia Geográfica", style: .body)
                            .fontWeight(.semibold)
                            .foregroundStyle(.grey500)
                        
                        TextComponent(text: "*", style: .body)
                            .foregroundStyle(.red400)
                            .fontWeight(.semibold)
                    }
                    
                    Rectangle()
                        .frame(maxWidth: .infinity, maxHeight: 50)
                    
                }
                
                //Mapa
                FieldComponent(type: .textArea, name: "Tramo Carretero", placeholder: "Ingrese el tramo carrtero", text: .constant(""), isRequired: true, fontSize: .body)
            }
        }
    }
}

#Preview {
    IncidentView()
}
