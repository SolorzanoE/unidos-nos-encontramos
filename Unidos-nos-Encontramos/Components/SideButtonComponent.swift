//
//  SideButtonComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 24/03/25.
//

import SwiftUI

enum SideButtonStyle {
    case home, alerts, configuration, close
    
    var icon: String {
        switch self {
        
        case .home:
            return "house.fill"
        case .alerts:
            return "exclamationmark.triangle.fill"
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
        case .alerts:
            return "Alertas"
        case .configuration:
            return "Configuración"
        case .close:
            return "Cerrar sesión"
        }
    }
}

struct SideButtonComponent: View {
    @State private var isPressed: Bool = false
    var style: SideButtonStyle
    var action: () -> Void

    var body: some View {
        Button(action: {
            isPressed.toggle()
            action()
        }) {
            HStack{
                Image(systemName: style.icon)
                    .foregroundStyle(isPressed ? Color.blue500 : Color.blue50)
                    .padding(.leading)
                TextComponent(text: style.title, Style: .body)
                .fontWeight(.medium)
                .foregroundColor(isPressed ? Color.blue500 : Color.blue50)
                
            
        }
            .frame(minWidth: 208, minHeight: 39, alignment: .leading)
                .background(isPressed ? Color.blue50 : Color.blue500)
                .cornerRadius(20)
                .animation(.easeInOut(duration: 0.2), value: isPressed)
        }
    }
}

#Preview {
    SideButtonComponent(style: SideButtonStyle.close, action: {})
}
