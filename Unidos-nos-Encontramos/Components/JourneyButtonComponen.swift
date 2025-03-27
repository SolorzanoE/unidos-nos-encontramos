//
//  JourneyButtonStyleComponen.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 25/03/25.
//

import SwiftUI

enum JourneyButtonStyle {
    case start, acept, confirm, inProgress

    var title: String {
        switch self {
        case .start:
            return "Iniciar trayecto"
        case .acept:
            return "Regresar"
        case .confirm:
            return "Cancelar"
        case .inProgress:
            return "Aceptar"
        }
    }
}

struct JourneyButtonComponen: View {
    let style: JourneyButtonStyle
    var action: () -> Void = {}

    var body: some View {
        Button(action: {
            action()
        }) {
            TextComponent(text: style.title, style: .subheadline)
                .fontWeight(.semibold)
                .padding(13)
                .foregroundColor(.white500)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(Color.blue500)
                .cornerRadius(8)
        }
    }
}

#Preview {
    JourneyButtonComponen(style: .start)
}
