//
//  PersonInformationForm.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 03/04/25.
//

import SwiftUI

struct PersonInformationForm: View {
    
    var body: some View {
        
        ZStack {
            
            BackgroundComponent(style: .white)
            
            VStack(spacing: 17) {
                
                FieldComponent(type: .textField, name: "¿Desea que sus datos sean anónimos?", placeholder: "Sí No", text: .constant(""), isRequired: true,  fontSize: .body)
                FieldComponent(type: .textField, name: "¿Cuál es su relación con la persona?", placeholder: "Seleccione una opción", text: .constant(""), fontSize: .body)
                
                
            }
        }
    }
}


#Preview {
    PersonInformationForm()
}

