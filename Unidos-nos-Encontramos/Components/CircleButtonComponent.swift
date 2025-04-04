//
//  CircleButtonComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 28/03/25.
//

import SwiftUI

struct CircleButtonComponent: View {
    
    var style: StyleButton
    var systemImage: String
    var action: () -> Void = {}
    
    var body: some View {
        
        Button {
            action()
        } label: {
            Image(systemName: systemImage)
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .padding()
                .foregroundStyle(.white500)
                .fontWeight(.bold)
        }.background(colorButton)
            .clipShape(Circle())
    }
    
    enum StyleButton {
        case red
        case blue
        case lightblue
    }
    
    var colorButton: Color {
        switch style {
        case .blue:
            Color.blue500
        case .red:
            Color.red500
        case .lightblue:
            Color.blue400
        }
    }
}

#Preview {
    CircleButtonComponent(style: .blue, systemImage: "exclamationmark")
}
