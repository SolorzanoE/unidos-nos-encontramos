//
//  CircleBadgeButtonComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 28/03/25.
//

import SwiftUI

struct CircleBadgeButtonComponent: View {
    
    var systemImage: String
    var numberBadge: Int?
    
    var body: some View {
        
        ZStack {
            CircleButtonComponent(style: .lightblue, systemImage: systemImage)
            
            if let numberBadge = numberBadge, numberBadge > 0 {
                TextComponent(text: "\(numberBadge)", style: .body)
                    .frame(width: 10, height: 10)
                    .foregroundStyle(.white50)
                    .fontWeight(.medium)
                    .padding(5)
                    .background(.red500)
                    .clipShape(Circle())
                    .offset(x: 18, y: -18)
            }
        }
    }
}

#Preview {
    CircleBadgeButtonComponent(systemImage: "tray.fill", numberBadge: 9)
}
