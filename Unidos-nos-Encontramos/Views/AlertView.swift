//
//  AlertView.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 03/04/25.
//

import SwiftUI

struct AlertView: View {
    @State private var isOn = false
    @State private var openNewContact: Bool = false
    var body: some View {
        ZStack(alignment: .top){
            VStack(spacing: 5){
                TextComponent(text: "Notificaciones de alerta", style: .title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.grey500)
                DividerComponent()
                    .padding(.horizontal)
                Toggle(isOn: $isOn) {
                    HStack(spacing: 13){
                        VStack(alignment: .leading ,spacing: 12){
                            HStack(alignment: .center, spacing: 13){
                                TextComponent(text: "10:30 AM", style: .headline)
                                    .fontWeight(.semibold)
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 3)
                                    .background(Color.yellow200)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                    .shadow(radius: 4, y: 4)
                                TextComponent(text: "Alerta mañanera", style: .body)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.grey700)
                            }
                            
                            TextComponent(text: "L, M | Emmanuel Solórzano, Alberto palo...", style: .callout)
                                .fontWeight(.medium)
                                .foregroundStyle(.grey700)
                        }
                        
                        
                    }
                    
                }
                .toggleStyle(.switch)
                .padding(10)
                .background(.yellow400)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .shadow(radius: 4, y: 4)
                .padding()
            }
            VStack{
                CircleButtonComponent(style: .blue, systemImage: "plus") {
                    openNewContact.toggle()
                    
                }.padding(.horizontal)
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(.bottom)
        }
        .fullScreenCover(isPresented: $openNewContact) {
            SendRequestContactView(isPresent: $openNewContact)
                .transition(.move(edge: .leading))
        }
    }
}


#Preview {
    AlertView()
}
