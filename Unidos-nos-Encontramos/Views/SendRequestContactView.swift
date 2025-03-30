//
//  Untitled.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 30/03/25.
//
import SwiftUI

struct SendRequestContactView: View {
    
    @State private var text: String = ""
    @Binding var isPresent: Bool
    
    var body: some View {
        
        ZStack {
            BackgroundComponent(style: .white)
            
            VStack(alignment: .leading, spacing: 25) {
                SearchComponent(text: $text, placeholder: "Buscar...")
                
                TextComponent(text: "Contactos sugeridos", style: .headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.grey500)
                
                ScrollView {
                    SearchCard(data: [
                        .init(name: "Eduardo Solórzano"),
                        .init(name: "Jesús Martínez"),
                        .init(name: "María González"),
                        .init(name: "Ana López"),
                        .init(name: "Carlos Ramírez"),
                        .init(name: "Fernanda Torres"),
                        .init(name: "Luis Hernández"),
                        .init(name: "Valeria Castillo"),
                        .init(name: "Diego Fernández"),
                        .init(name: "Andrea Mendoza")
                    ])
                }.clipped()
                    .scrollIndicators(.hidden)
            }.padding(.horizontal)
                .padding(.top, 10)
                .safeAreaInset(edge: .top) {
                    NavigationButtonComponent(style: .back) {
                        isPresent = false
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                }
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
                        
                        Button {
                            
                        } label: {
                            TagComponent(text: "Agregar", color: .blue600)
                        }.background(.blue600)
                            .clipShape(RoundedRectangle(cornerRadius: 6))
                    }
                }
            }
        }
    }
    
    struct Data: Identifiable {
        let id = UUID()
        let name: String
    }
}

#Preview {
    SendRequestContactView(isPresent: .constant(false))
}
