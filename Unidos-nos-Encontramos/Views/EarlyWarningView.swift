//
//  EarlyWarningView.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 03/04/25.
//


import SwiftUI

struct EarlyWarningView: View {
    @State private var isOn = false
    @State private var openNewContact: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(spacing: 5) {
                TextComponent(text: "Alerta inmediata", style: .title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.grey500)
                
                DividerComponent()
                    .padding(.horizontal)
                
                ScrollView {
                    EarlyWarningCard(data: [
                        .init(name: "Lucía Torres", relationShip: "Familiar"),
                        .init(name: "Carlos Ruiz", relationShip: "Vecino")
                    ])
                }
                .clipped()
                .scrollIndicators(.hidden)
                .padding(.top)
            }
            
            VStack {
                CircleButtonComponent(style: .red, systemImage: "exclamationmark") {
                    openNewContact.toggle()
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            .padding(.bottom)
        }
        .background(BackgroundComponent(style: .white))
        .fullScreenCover(isPresented: $openNewContact) {
            FormView(isPresent: $openNewContact)
                .transition(.move(edge: .leading))
        }
    }
}

private struct EarlyWarningCard: View {
    let data: [Data]
    
    var body: some View {
        VStack(spacing: 19) {
            ForEach(data) { person in
                TemplateCardComponent(color: .red) {
                    HStack(spacing: 5) {
                        TextComponent(text: person.name, style: .subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white500)
                            .lineLimit(1)
                        
                        Spacer()
                        
                        TagComponent(text: person.relationShip, color: .red800)
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
    EarlyWarningView()
}
