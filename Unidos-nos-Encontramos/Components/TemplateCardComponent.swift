//
//  TemplateCardComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 26/03/25.
//

import SwiftUI

struct TemplateCardComponent<Content: View>: View {
    
    let content: Content?
    var color: StyleColor = .blue
    
    init(color: StyleColor, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.color = color
    }
    
    var body: some View {
        
        HStack(alignment: .center) {
            content
        }.frame(maxWidth: .infinity, minHeight: 60)
            .padding()
            .background {
                LinearGradient(
                    stops: [
                        .init(color: useColor.leftColor, location: 0),
                        .init(color: useColor.rightColor, location: 1)
                    ],
                    startPoint: .leading,
                    endPoint: .trailing
                )
            }
            .foregroundStyle(.white50)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal, 10)
            .shadow(radius: 3, y: 4)
    }
    
    enum StyleColor {
        case blue
        case green
        case red
    }
    
    var useColor: (leftColor: Color, rightColor: Color) {
        switch color {
        case .blue:
            (.blue600, .skyBlue600)
        case .green:
            (.green700, .green300)
        case .red:
            (.red700, .red300)
        }
    }
}

#Preview {
    TemplateCardComponent(color: .red) {
        TextComponent(text: "Eduardo", style: .body)
    }
}
