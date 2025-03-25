//
//  LogButtonComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 25/03/25.
//

import SwiftUI

enum LogButtonStyle {
    case google, apple, facebook

    var icon: String {
        switch self {
        case .google:
            return "google"
        case .apple:
            return "apple"
        case .facebook:
            return "facebook"
       
        }
    }

    var title: String {
        switch self {
        case .google:
            return "Google"
        case .apple:
            return "Apple"
        case .facebook:
            return "Facebook"
  
        }
    }
}

struct LogExternButtonComponent: View {
    let style: LogButtonStyle
    var action: () -> Void = {}

    var body: some View {
        Button(action: {
            action()
        }) {
            HStack(spacing: 11) {
                Image(style.icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26.85)
                TextComponent(text: style.title, style: .subheadline)
                    .foregroundColor(.black)
                    .fontWeight(.medium)
            }.frame(maxWidth: .infinity, minHeight: 45)
        }.background(.white400)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius:3, y: 3)
    }
}

#Preview {
    LogExternButtonComponent(style: .apple)
}
