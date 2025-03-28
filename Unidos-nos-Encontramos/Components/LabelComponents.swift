//
//  LabelComponents.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 23/03/25.
//

import SwiftUI

enum CustomLabel {
    case textField, secureField, textArea

    func fieldView(text: Binding<String>, placeholder: String, fontSize: CGFloat) -> some View {
        switch self {
        case .textField:
            return AnyView(
                TextField(placeholder, text: text)
                    .font(.custom("Montserrat", size: fontSize))
                    .foregroundStyle(.grey400)
                    .padding(.leading)
                    .frame(minWidth: 388, minHeight: 35)
                    .background(Color.grey50)
                    .cornerRadius(5)
                    .shadow(radius: 3, y: 3)
            )
        case .secureField:
            return AnyView(
                SecureField(placeholder, text: text)
                    .font(.custom("Montserrat", size: fontSize))
                    .foregroundStyle(.grey400)
                    .padding(.leading)
                    .frame(minWidth: 388, minHeight: 35)
                    .background(Color.grey50)
                    .cornerRadius(5)
                    .shadow(radius: 3, y: 3)
            )
        case .textArea:
            return AnyView(
                TextEditor(text: text)
                    .font(.custom("Montserrat", size: fontSize))
                    .foregroundStyle(.grey400)
                    .background(Color.grey50)
                    .frame(minWidth: 388, minHeight: 35)
                    .foregroundColor(.gray)
                    .cornerRadius(5)
                    .shadow(radius: 3, y: 3)
            )
        }
    }
}


struct LabelComponents: View {
    var labelType: CustomLabel
    var labelText: String
    var connector: String
    @Binding var text: String
    var isRequired: Bool = false
    var showValidation: Bool = false
    var fontSize: CGFloat

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            let showError = isRequired && text.trimmingCharacters(in: .whitespaces).isEmpty && showValidation

            HStack(spacing: 2) {
                TextComponent(text: labelText, style: .body)
                    .fontWeight(.semibold)
                    .foregroundStyle(.grey500)

                if isRequired {
                    TextComponent(text: "*", style: .body)
                        .foregroundStyle(.red400)
                        .fontWeight(.semibold)
                }
            }

            labelType.fieldView(text: $text, placeholder: "Ingresa \(connector) \(labelText.lowercased())", fontSize: fontSize)
               

            if showError {
                TextComponent(text: "Este campo es obligatorio", style: .caption)
                    .foregroundStyle(.red400)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    LabelComponents(labelType: .textField, labelText: "Nombre", connector: "tu", text: .constant(""), isRequired: true, showValidation: true, fontSize: 16)
}
