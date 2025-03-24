//
//  FormButtonComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 23/03/25.
//

import SwiftUI

enum CustomButtonStyle {
    case continuar, regresar, cancelar

    var backgroundColor: Color {
        switch self {
        case .continuar:
            return .blue600
        case .regresar:
            return .blue600
        case .cancelar:
            return .blue400
        }
    }

    var title: String {
        switch self {
        case .continuar:
            return "Continuar"
        case .regresar:
            return "Regresar"
        case .cancelar:
            return "Cancelar"
        }
    }
}

struct FormButtonComponent: View {
    var style: CustomButtonStyle
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            TextComponent(text: style.title, Style: .subheadline)
                .padding()
                .foregroundColor(.white500)
                .frame(minWidth: 137, maxWidth: .infinity, minHeight: 47)
                .background(style.backgroundColor)
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}

#Preview {
    VStack(spacing: 20) {
        FormButtonComponent(style: .continuar, action: {});
        FormButtonComponent(style: .regresar, action: {});
        FormButtonComponent(style: .cancelar, action: {});
    }
}
