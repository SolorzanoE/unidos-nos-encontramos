//
//  SearchComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 25/03/25.
//

import SwiftUI

struct SearchComponent: View {
    
    @Binding var text: String
    let placeholder: String
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
                .resizable()
                .scaledToFit()
                .frame(height: 22)
                .foregroundStyle(.grey500)
            
            TextField(
                "TextField",
                text: $text,
                prompt: Text(placeholder)
                    .foregroundStyle(.grey400)
            ).foregroundStyle(.grey500)
                .font(.custom("Montserrat", size: 18))
        }.padding(8)
            .background(.white400)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.25), radius: 7)
    }
}

#Preview {
    SearchComponent(text: .constant("hola"), placeholder: "Buscar...")
}
