//
//  GenerateSearchCardView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 30/03/25.
//

import SwiftUI

struct GenerateSearchCardView: View {
    
    var body: some View {
        
        ZStack {
            
            BackgroundComponent(style: .white)
            
            VStack(spacing: 15) {
                Image(systemName: "exclamationmark.triangle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 100)
                    .foregroundStyle(.yellow500)
                
                TextComponent(text: "Crear ficha de búsqueda", style: .title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.grey500)
                    .multilineTextAlignment(.center)
                
                TextComponent(text: "Selecciona el contacto", style: .headline)
                    .fontWeight(.medium)
                    .foregroundStyle(.grey500)
                    .multilineTextAlignment(.center)
                
                ScrollView {
                    SearchCard(data: [
                        .init(name: "Eduardo Solórzano", relationShip: "Amigo")
                    ])
                }.clipped()
                    .scrollIndicators(.hidden)
            }.padding(.horizontal)
                .padding(.top, 30)
        }
    }
}

private struct SearchCard: View {
    
    let data: [Data]
    
    var body: some View {
        
        VStack(spacing: 19) {
            
            ForEach(data) { data in
                
                TemplateCardComponent(color: .blue) {
                    
                    HStack(spacing: 5) {
                        
                        TextComponent(text: data.name, style: .subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white500)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        TagComponent(text: data.relationShip, color: .blue600)
                        
                    }
                }
            }
        }
    }
    
    struct Data: Identifiable {
        let id = UUID()
        let name: String
        let relationShip: String
    }
}

#Preview {
    GenerateSearchCardView()
}
