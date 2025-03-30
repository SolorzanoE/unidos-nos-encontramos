//
//  SearchCardView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 28/03/25.
//

import SwiftUI

struct SearchCardView: View {
    
    @State private var isPresent: Bool = false
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                SearchCard(data: [
                    .init(name: "Eduardo Solórzano", relationShip: "Amigo")
                ])
            }.clipped()
                .scrollIndicators(.hidden)
                .padding(.top)
            
            CircleButtonComponent(style: .red, systemImage: "exclamationmark") {
                isPresent.toggle()
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(.bottom)
            
        }.padding(.horizontal)
            .background(BackgroundComponent(style: .white))
            .sheet(isPresented: $isPresent) {
                GenerateSearchCardView()
                    .presentationDetents([.fraction(0.8)])
                    .presentationCornerRadius(25)
                    .presentationDragIndicator(.visible)
            }
            .overlay {
                if isPresent {
                    Color.grey900.opacity(0.65)
                        .ignoresSafeArea()
                        
                }
            }
    }
}

private struct SearchCard: View {
    
    let data: [Data]
    
    var body: some View {
        
        VStack(spacing: 19) {
            
            ForEach(data) { data in
                
                TemplateCardComponent(color: .red) {
                    
                    HStack(spacing: 5) {
                        
                        TextComponent(text: data.name, style: .subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white500)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        TagComponent(text: data.relationShip, color: .red800)
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
    SearchCardView()
}
