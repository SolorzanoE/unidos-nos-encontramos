//
//  MenuComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 28/03/25.
//

import SwiftUI

struct MenuComponent: View {
    
    @Binding var isSelected: Bool
    var size: CGFloat = 50
    
    var body: some View {
        
        ZStack {
            Button {
                isSelected.toggle()
            } label: {
                Image(systemName: "line.3.horizontal.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.white400, .blue700)
            }.background(.blue700)
                .clipShape(Circle())
                .frame(width: size)
        }
    }
}

#Preview {
    MenuComponent(isSelected: .constant(true))
}
