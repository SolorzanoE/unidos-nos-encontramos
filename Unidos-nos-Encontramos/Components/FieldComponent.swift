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
                        TextComponent(text: "*", style: .body)
                            .foregroundStyle(.red400)
                            .fontWeight(.semibold)
                    }
                }
            }
            
            type.fieldView(text: $text, placeholder: placeholder)
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
}

enum TypeField {
    case textField
    case secureField
    case textArea
    
    @ViewBuilder
    func fieldView(text: Binding<String>, placeholder: String) -> some View {
        switch self {
        case .textField:
            TextField(text: text) {
                customPlaceholder(placeholder)
            }
        case .secureField:
            HStack {
                
                SecureField(text: text) {
                    customPlaceholder(placeholder)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "eye")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.grey400)
                }.frame(maxWidth: 25)
            }
        case .textArea:
            TextEditor(text: text)
        }
    }
    
    private func customPlaceholder(_ text: String) -> some View {
        Text(text)
            .foregroundStyle(.grey400)
    }
}

#Preview {
    FieldComponent(type: .secureField, name: "Nombre", placeholder: "Ingresa tu nombre", text: .constant(""))
}
