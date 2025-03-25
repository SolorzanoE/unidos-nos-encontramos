//
//  IconsComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 25/03/25.
//

import SwiftUI

enum IconStyle {
    case person, mail, heart, key, file, alert, map
    
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
        case .map:
            return "map.fill"
        }
    }
}

struct IconsComponent: View {
    var changeColor: Bool = false
    let style: IconStyle
    
    var body: some View {
        Image(systemName: style.icon)
            .frame(minWidth: 45, minHeight: 45)
            .foregroundStyle(changeColor ? Color.blue500 : Color.blue50)
            .background(changeColor ? Color.blue50 : Color.blue500)
            .clipShape(Circle())
            .animation(.easeInOut(duration: 0.2), value: changeColor)
    }
}

#Preview {
    IconsComponent(style: IconStyle.map)
}
