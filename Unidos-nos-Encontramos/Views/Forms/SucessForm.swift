//
//  SucessForm.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 03/04/25.
//

import SwiftUI

struct SucessForm: View {
    
    var body: some View {
        
        ZStack {
            
            BackgroundComponent(style: .white)
            
            VStack(spacing: 17) {
                
                FieldComponent(type: .textField, name: "Fecha y Hora de los Hechos", placeholder: "Ingrese la fecha y hora", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "Fecha y Hora en la que se Percató", placeholder: "Ingrese la fecha y hora", text: .constant(""), fontSize: .body)
                
                FieldComponent(type: .textField, name: "Circunstancia", placeholder: "Seleccione una opción", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textArea, name: "Descripción de los Hechos", placeholder: "Ingrese la descripción", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .textField, name: "¿Acompañaba usted a la persona?", placeholder: "Sí No", text: .constant(""), isRequired: true,  fontSize: .body)
                
                FieldComponent(type: .textField, name: "Hipótesis del Paradero", placeholder: "Ingrese la hipótesis", text: .constant(""), isRequired: true, fontSize: .body)
                
            }
        }
    }
}
#Preview {
    SucessForm()
}
