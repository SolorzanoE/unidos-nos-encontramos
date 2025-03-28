//
//  JourneyButtonStyleComponen.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 25/03/25.
//

import SwiftUI

struct JourneyButtonComponent: View {
    let text: String
    var action: () -> Void = {}

    var body: some View {
        Button(action: {
            action()
        }) {
            TextComponent(text: text, style: .subheadline)
                .fontWeight(.semibold)
                .padding(13)
                .foregroundColor(.white500)
                .frame(maxWidth: .infinity)
        }.background(.blue500)
            .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}

#Preview {
    JourneyButtonComponent(text: "Hola")
}
