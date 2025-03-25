//
//  FontWeightComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 23/03/25.
//

import SwiftUI

enum FontStyle {
    case largeTitle, title, title2, title3, headline, subheadline, body, callout, caption

    var size: CGFloat {
        switch self {
        case .largeTitle: return 61
        case .title: return 49
        case .title2: return 39
        case .title3: return 31
        case .headline: return 25
        case .subheadline: return 20
        case .body: return 16
        case .callout: return 13
        case .caption: return 10
        }
    }
}

struct TextComponent: View {
    var text: String
    var style: FontStyle

    var body: some View {
        Text(text)
            .font(.custom("Montserrat", size: style.size))
    }
}

#Preview {
    TextComponent(text: "Hello", style: .largeTitle)
}
