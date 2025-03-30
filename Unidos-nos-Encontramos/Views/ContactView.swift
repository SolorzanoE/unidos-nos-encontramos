//
//  ContactView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 28/03/25.
//

import SwiftUI

struct ContactView: View {
    
    @State private var openNewContact: Bool = false
    @State private var openTray: Bool = false
    
    var body: some View {
        
        ZStack {
            
            ScrollView {
                VStack(spacing: 19) {
                    SectionContact(name: "Destacados", data: [
                        .init(name: "Eduardo Solórzano", cellphone: "+52 123 456 7890", relationShip: "Brother"),
                        .init(name: "Jesús Martínez", cellphone: "+52 987 654 3210", relationShip: "Friend"),
                        .init(name: "María González", cellphone: "+52 555 123 4567", relationShip: "Mother")
                    ])
                    
                    SectionContact(name: "Familiares", data: [
                        .init(name: "Carlos Ramírez", cellphone: "+52 811 223 3344", relationShip: "Father"),
                        .init(name: "Fernanda Torres", cellphone: "+52 722 556 7788", relationShip: "Sister"),
                        .init(name: "Ricardo Mendoza", cellphone: "+52 333 999 1122", relationShip: "Uncle"),
                        .init(name: "Sofía Herrera", cellphone: "+52 555 666 7777", relationShip: "Aunt"),
                        .init(name: "Alejandro Navarro", cellphone: "+52 664 123 9876", relationShip: "Friend"),
                        .init(name: "Valeria Domínguez", cellphone: "+52 442 789 6541", relationShip: "Girlfriend")
                    ])
                    
                    SectionContact(name: "Conocidos", data: [
                        .init(name: "Carlos Ramírez", cellphone: "+52 811 223 3344", relationShip: "Father"),
                        .init(name: "Fernanda Torres", cellphone: "+52 722 556 7788", relationShip: "Sister"),
                        .init(name: "Ricardo Mendoza", cellphone: "+52 333 999 1122", relationShip: "Uncle"),
                        .init(name: "Sofía Herrera", cellphone: "+52 555 666 7777", relationShip: "Aunt"),
                        .init(name: "Alejandro Navarro", cellphone: "+52 664 123 9876", relationShip: "Friend"),
                        .init(name: "Valeria Domínguez", cellphone: "+52 442 789 6541", relationShip: "Girlfriend")
                    ])
                }
            }.clipped()
                .scrollIndicators(.hidden)
            
            VStack {
                CircleBadgeButtonComponent(systemImage: "tray.fill", numberBadge: 5) {
                    openTray.toggle()
                }
                
                CircleButtonComponent(style: .blue, systemImage: "plus") {
                    openNewContact.toggle()
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                .padding(.bottom)
        }.padding(.horizontal)
            .background(BackgroundComponent(style: .white))
            .fullScreenCover(isPresented: $openNewContact) {
                SendRequestContactView(isPresent: $openNewContact)
                    .transition(.move(edge: .leading))
            }
            .fullScreenCover(isPresented: $openTray) {
                
            }
    }
}

private struct SectionContact: View {
    
    let name: String
    let data: [Data]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            TextComponent(text: name, style: .headline)
                .foregroundStyle(.grey500)
                .fontWeight(.semibold)
            
            VStack(spacing: 19) {
                
                ForEach(data) { data in
                    
                    TemplateCardComponent(color: .blue) {
                        
                        HStack(spacing: 5) {
                            
                            VStack(alignment: .leading) {
                                
                                TextComponent(text: data.name, style: .subheadline)
                                
                                Spacer()
                                
                                TextComponent(text: data.cellphone, style: .body)
                            }.fontWeight(.medium)
                                .foregroundStyle(.white500)
                                .lineLimit(1)
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                
                                TagComponent(text: data.relationShip, color: .blue600)
                                
                                Spacer()
                                
                                Image(systemName: "star.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25)
                                    .foregroundStyle(.yellow500)
                            }
                        }
                    }
                }
            }
        }
    }
    
    struct Data: Identifiable {
        let id = UUID()
        let name: String
        let cellphone: String
        let relationShip: String
    }
}

#Preview {
    ContactView()
}
