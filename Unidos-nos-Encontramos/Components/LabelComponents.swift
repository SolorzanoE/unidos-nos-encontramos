//
//  LabelComponents.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 23/03/25.
//

import SwiftUI

enum CustomLabel {
    case textField
    case secureField
    case textArea
}

struct FieldView: View {
    var labelType: CustomLabel
    var labelText: String
    var connector: String
    @Binding var text: String
    var isRequired: Bool = false
    var showValidation: Bool = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            let showError = isRequired && text.trimmingCharacters(in: .whitespaces).isEmpty && showValidation

            // Etiqueta con asterisco rojo si es requerido
            HStack(spacing: 2) {
                TextComponent(text: labelText, Style: .subheadline)
                    .foregroundStyle(.grey500)

                if isRequired {
                    Text("*")
                        .foregroundStyle(Color.red) // Puedes usar .red600 si está definido como extension
                        .font(.subheadline)
                }
            }

            switch labelType {
            case .textField:
                TextField("Ingresa \(connector) \(labelText.lowercased())", text: $text)
                    .font(.custom("Montserrat", size: 20))
                    .foregroundStyle(.grey400)
                    .padding(.leading)
                    .frame(minWidth: 381, maxWidth: .infinity, minHeight: 45)
                    .background(Color.grey50)
                    .cornerRadius(5)
                    .shadow(radius: 3, y: 3)

            case .secureField:
                SecureField("Ingresa \(connector) \(labelText.lowercased())", text: $text)
                    .font(.custom("Montserrat", size: 20))
                    .padding(.leading)
                    .frame(minWidth: 381, maxWidth: .infinity, minHeight: 45)
                    .background(Color.grey50)
                    .cornerRadius(5)
                    .shadow(radius: 3, y: 3)

            case .textArea:
                TextEditor(text: $text)
                    .font(.custom("Montserrat", size: 20))
                    .frame(minWidth: 381, maxWidth: .infinity, minHeight: 45)
                    .background(Color.grey50)
                    .foregroundStyle(.grey400)
                    .cornerRadius(5)
                    .shadow(radius: 3, y: 3)
            }

            if showError {
                Text("Este campo es obligatorio")
                    .font(.caption)
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State private var name = ""
        @State private var password = ""
        @State private var description = ""
        @State private var showValidation = false

        var body: some View {
            ScrollView {
                VStack(spacing: 20) {
                    FieldView(labelType: .textField, labelText: "Nombre", connector: "tu", text: $name, isRequired: true, showValidation: showValidation)
                    FieldView(labelType: .secureField, labelText: "Contraseña", connector: "tu", text: $password, isRequired: true, showValidation: showValidation)
                    FieldView(labelType: .textArea, labelText: "Descripción", connector: "", text: $description, isRequired: true, showValidation: showValidation)

                    Button("Enviar") {
                        showValidation = true
                        if name.trimmingCharacters(in: .whitespaces).isEmpty || password.trimmingCharacters(in: .whitespaces).isEmpty {
                            print("Faltan campos requeridos")
                        } else {
                            print("Datos enviados correctamente")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
                .padding()
            }
        }
    }

    return PreviewWrapper()
}
