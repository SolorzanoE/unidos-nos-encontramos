//
//  SideButtonComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 24/03/25.
//

import SwiftUI

// Esto es excederse con el enum, pero va
enum SideButtonStyle {
    case home, alert, earlyWarning , configuration, close
    
    var icon: String {
        switch self {
            
        case .home:
            return "house.fill"
        case .alert:
            return "exclamationmark.triangle.fill"
        case .earlyWarning:
            return "person.badge.shield.exclamationmark.fill"
        case .configuration:
            return "gearshape.fill"
        case .close:
            return "power"
        }
    }
    
    var title: String {
        switch self {
            
        case .home:
            return "Inicio"
        case .alert:
            return "Alertas"
        case .earlyWarning:
            return "Alerta inmediata"
        case .configuration:
            return "Configuración"
        case .close:
            return "Cerrar sesión"
        }
    }
}

struct SideButtonComponent: View {
    
    var isPressed: Bool = false
    let style: SideButtonStyle
    var action: () -> Void = {}
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack {
                Image(systemName: style.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24)
                
                TextComponent(text: style.title, style: .body)
                    .fontWeight(.medium)
                    .lineLimit(1)
            }.foregroundStyle(isPressed ? Color.blue500 : Color.white500)
                .frame(maxWidth: .infinity, alignment: .leading)
            .animation(.easeInOut(duration: 0.2), value: isPressed)
        }.padding(.horizontal)
            .padding(.vertical, 10)
            .background(isPressed ? Color.blue50 : Color.blue500)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: .black.opacity(0.25), radius: 4, y: 4)
    }
}

#Preview {
    SideButtonComponent(style: .alert)
}
