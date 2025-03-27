//
//  NavigationButtonComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 25/03/25.
//

import SwiftUI

enum NavigationButtonStyle {
    case exit, back, side
    
    var icon: String {
        switch self {
        case .exit:
            return "multiply"
        case .back:
            return "chevron.backward"
        case .side:
             return "line.3.horizontal"
        }
    }
}

struct NavigationButtonComponent: View {
    let style: NavigationButtonStyle
    var action: () -> Void = {}
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: style.icon)
                .resizable()
                .scaledToFit()
                .padding(13)
                .frame(maxWidth: 40, maxHeight: 40)
                .fontWeight(.bold)
                .foregroundStyle(Color.white500)
                .background( Color.blue700)
                .clipShape(Circle())
        }
    }
}

#Preview {
    NavigationButtonComponent(style: .side)
        .frame(width: 45)
}
