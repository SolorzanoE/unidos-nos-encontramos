//
//  FieldComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 23/03/25.
//

import SwiftUI

struct FieldComponent: View {
    
    let type: TypeField
    var name: String?
    let placeholder: String
    @Binding var text: String
    var isRequired: Bool = false
    var fontSize: FontStyle = .body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            
            if let name = name {
                HStack(spacing: 2) {
                    TextComponent(text: name, style: fontSize)
                        .fontWeight(.semibold)
                        .foregroundStyle(.grey500)
                    
                    if isRequired {
                        TextComponent(text: "*", style: fontSize)
                            .foregroundStyle(.red400)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            type.fieldView(text: $text, placeholder: placeholder)
                .textInputAutocapitalization(.never)
                .font(.custom("Montserrat", size: fontSize.size))
                .foregroundStyle(.grey500)
                .padding(10)
                .background(.grey50)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(color: .black.opacity(0.25), radius: 3, y: 3)
                
            if isRequired {
                
            }
            
            //            if showError {
            //                TextComponent(text: "Este campo es obligatorio", style: .caption)
            //                    .foregroundStyle(.red400)
            //                    .fontWeight(.semibold)
            //            }
        }
    }
    
    enum TypeField {
        case textField
        case secureField(SecureStyle)
        case textArea
        
        @ViewBuilder
        func fieldView(text: Binding<String>, placeholder: String) -> some View {
            switch self {
            case .textField:
                TextField(text: text) {
                    customPlaceholder(placeholder)
                }
            case .secureField(let style):
                switch style {
                case .hidden:
                    SecureField(text: text) {
                        customPlaceholder(placeholder)
                    }
                case .show:
                    SecureFieldComponent(password: text, placeholder: placeholder)
                }
            case .textArea:
                TextEditor(text: text)
            }
        }
        
        enum SecureStyle {
            case hidden
            case show
        }
    }
}

private struct SecureFieldComponent: View {
    
    @State private var showPassword = false
    @Binding var password: String
    let placeholder: String
    
    var body: some View {
        
        HStack(alignment: .center) {
            if showPassword {
                TextField(text: $password) {
                    customPlaceholder(placeholder)
                }
            } else {
                SecureField(text: $password) {
                    customPlaceholder(placeholder)
                }
            }
            
            Button {
                showPassword.toggle()
            } label: {
                Image(systemName: showPassword ? "eye.slash" : "eye")
                    .foregroundStyle(.grey400)
            }.frame(maxWidth: 25)
        }
    }
}

// MARK: - file utils functions
private func customPlaceholder(_ text: String) -> some View {
    Text(text)
        .foregroundStyle(.grey400)
}

#Preview {
    FieldComponent(type: .textField, name: "Contraseña", placeholder: "Ingresa tu contraseña", text: .constant(""), fontSize: .body)
}
