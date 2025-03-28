//
//  SearchComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 25/03/25.
//

import SwiftUI

struct SearchComponent: View {
    
    @State var text: String
    let placeholder: String
    
    var body: some View {
        
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.grey500)
            
            TextField(
                "TextField",
                text: $text,
                prompt: Text(placeholder)
                    .foregroundStyle(.grey400)
            ).foregroundStyle(.grey500)
                .font(.custom("Montserrat", size: 16))
        }.padding(8)
            .background()
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.25), radius: 7)
    }
}

#Preview {
    SearchComponent(text: "a", placeholder: "Buscar...")
}
