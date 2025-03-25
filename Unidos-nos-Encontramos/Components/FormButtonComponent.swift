//
//  FormButtonComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 23/03/25.
//

import SwiftUI

enum CustomButtonStyle {
    case next, back, cancel, acept

    var backgroundColor: Color {
        switch self {
        case .next:
            return .blue600
        case .back:
            return .blue400
        case .cancel:
            return .blue400
        case .acept:
            return .blue600
        }
    }

    var title: String {
        switch self {
        case .next:
            return "Continuar"
        case .back:
            return "Regresar"
        case .cancel:
            return "Cancelar"
        case .acept:
            return "Aceptar"
        }
    }
}

struct FormButtonComponent: View {
    let style: CustomButtonStyle
    var action: () -> Void = {}

    var body: some View {
        Button(action: {
            action()
        }) {
            TextComponent(text: style.title, style: .subheadline)
                .fontWeight(.medium)
                .padding(10)
                .foregroundColor(.white500)
                .frame(minWidth: 137, minHeight: 47)
                .background(style.backgroundColor)
                .cornerRadius(10)
        }
    }
}

#Preview {
    FormButtonComponent(style: .acept)
}
