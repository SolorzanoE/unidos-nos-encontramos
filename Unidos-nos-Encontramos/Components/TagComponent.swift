//
//  TagComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 30/03/25.
//

import SwiftUI

struct TagComponent: View {
    
    let text: String
    let color: Color
    
    var body: some View {
        TextComponent(text: text, style: .body)
            .fontWeight(.medium)
            .padding(.vertical, 4)
            .padding(.horizontal, 6)
            .foregroundStyle(.white500)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    TagComponent(text: "Hola", color: .red)
}
