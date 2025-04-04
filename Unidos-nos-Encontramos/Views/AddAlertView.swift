//
//  AddAlertView.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 03/04/25.
//

import SwiftUI

struct AddAlertView: View {
    
    @State private var isPresented: Bool = false
    @State private var selectedTime = Date()
    var body: some View {
        ZStack(alignment: .top){
            BackgroundComponent(style: .gradientOceanBlue)
            VStack(spacing: 11){
                DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                
                    .datePickerStyle(.wheel)
                    .labelsHidden()
                
                    .background(.ultraThinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 3)
                    .padding()
                    .environment(\.colorScheme, .dark)
                VStack(spacing: 17){
                    VStack(spacing: -10){
                        HStack{
                            TextComponent(text: "Repetir *", style: .body)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white400)
                            Spacer()
                        }.padding(.leading)
                        FieldComponent(type: .textField, name: "", placeholder: "Lunes, Martes, Jueves", text: .constant(""), isRequired: false, fontSize: .body)
                            .padding(.horizontal)
                    }
                    VStack(spacing: -10){
                        HStack{
                            TextComponent(text: "Etiqueta", style: .body)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white400)
                            Spacer()
                        }.padding(.leading)
                        FieldComponent(type: .textField, name: "", placeholder: "Ingrese el nombre", text: .constant(""), isRequired: false, fontSize: .body)
                            .padding(.horizontal)
                    }
                    
                    TextComponent(text: "Selecciona a tus contactos a informar", style: .headline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.white50)
                        .padding(.top,20)
                    
                    ScrollView{
                        FriendCard(data: [
                            .init(name: "Carlos Ramírez", cellphone: "+52 811 223 3344", relationShip: "Father"),
                            .init(name: "Fernanda Torres", cellphone: "+52 722 556 7788", relationShip: "Sister"),
                            .init(name: "Ricardo Mendoza", cellphone: "+52 333 999 1122", relationShip: "Uncle"),
                            .init(name: "Sofía Herrera", cellphone: "+52 555 666 7777", relationShip: "Aunt"),
                            .init(name: "Alejandro Navarro", cellphone: "+52 664 123 9876", relationShip: "Friend"),
                            .init(name: "Valeria Domínguez", cellphone: "+52 442 789 6541", relationShip: "Girlfriend")
                        ])
                    }.clipped()
                    
                    JourneyButtonComponent(text: "Aceptar")
                        .padding(.horizontal)
                }
                
            }
        }.safeAreaInset(edge: .top) {
            Button(action: {
                
            }) {
                NavigationButtonComponent(style: .exit) {
                    isPresented = false
                }
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing)
            
            
        }
    }
}
private struct FriendCard: View {
    
    
    let data: [Data]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5) {
            
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
    AddAlertView()
}
