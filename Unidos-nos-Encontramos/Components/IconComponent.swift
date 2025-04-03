//
//  IconsComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 25/03/25.
//

import SwiftUI

enum IconStyle {
    case person, mail, heart, key, file, alert, alert2, map
    
    var icon: String {
        switch self {
        case .person:
            return "person.fill"
        case .mail:
            return "envelope.fill"
        case .heart:
            return "heart.fill"
        case .key:
            return "key.horizontal.fill"
        case .file:
            return "text.document.fill"
        case .alert:
            return "exclamationmark.triangle.fill"
        case .alert2:
            return "person.badge.shield.exclamationmark.fill"
        case .map:
            return "map.fill"
        }
    }
}

struct IconComponent: View {
    var changeColor: Bool = true
    let style: IconStyle
    
    var body: some View {
        Image(systemName: style.icon)
            .resizable()
            .scaledToFit()
            .frame(width: 25, height: 25)
            .padding(10)
            .foregroundStyle(changeColor ? Color.blue300 : Color.blue50)
            .background(changeColor ? Color.blue50 : Color.blue500)
            .clipShape(Circle())
            .shadow(radius: 4, y: 4)
            .animation(.easeInOut(duration: 0.2), value: changeColor)
    }
}

#Preview {
    IconComponent(style: IconStyle.map)
}
