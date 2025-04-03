//
//  AccountForm.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import SwiftUI

struct AccountForm: View {
    
    @State private var cellphone: String = ""
    @State private var email: String = ""
    @State private var address: String = ""
    
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
                
                FieldComponent(type: .secureField(.hidden), name: "Contraseña", placeholder: "Ingrese una contraseña", text: .constant(""), isRequired: true, fontSize: .body)
                
                FieldComponent(type: .secureField(.hidden), name: "Ingrese nuevamente su contraseña", placeholder: "Ingrese nuevamente su contraseña", text: .constant(""), isRequired: true, fontSize: .body)
               
            }
        }
    }
}

#Preview {
    AccountForm()
}
