//
//  RequestContactView.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 01/04/25.
//

import SwiftUI

struct RequestContactView: View {
    
    @Binding var isPresented: Bool
    var body: some View {
        ZStack(alignment: .top){
            VStack(spacing: 6){
                TextComponent(text: "Solicitudes de contacto", style: .title3)
                    .foregroundStyle(.grey500)
                    .fontWeight(.medium)
                DividerComponent()
                    .padding(.horizontal)
                ScrollView{
                    VStack{
                        SectionContact(data: [
                            .init(name: "Eduardo Solórzano", cellphone: "+52 123 456 7890"),
                            .init(name: "Jesús Martínez", cellphone: "+52 987 654 3210"),
                            .init(name: "María González", cellphone: "+52 555 123 4567")
                        ])
                    }
                }.padding(.top)
            }
           
        }.frame(maxWidth: .infinity, maxHeight: .infinity).safeAreaInset(edge: .top) {
            NavigationButtonComponent(style: .back, action: {
                isPresented = false
                       })
                       .frame(maxWidth: .infinity, alignment: .leading)
                       .padding(.leading)
                   }
        }
    }


private struct SectionContact: View {
    let data: [Data]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            VStack(spacing: 15) {
                ForEach(data) { data in
                    TemplateCardComponent(color: .blue) {
                        HStack(alignment: .bottom, spacing: 5) {
                            VStack(alignment: .leading) {
                                TextComponent(text: data.name, style: .subheadline)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                HStack(alignment: .center) {
                                    TextComponent(text: data.cellphone, style: .body)
                                    
                                    Spacer()
                                    
                                    // Botón Rechazar
                                    Button(action: {
                                        print("\(data.name) rechazado")
                                        // Aquí puedes agregar la acción de rechazo
                                    }) {
                                        Text(data.reject)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .background(Color.blue400)
                                            .foregroundColor(.white)
                                            .cornerRadius(6)
                                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.blue50))
                                    }
                                    
                                    // Botón Aceptar
                                    Button(action: {
                                        print("\(data.name) aceptado")
                                        // Aquí puedes agregar la acción de aceptación
                                    }) {
                                        Text(data.acept)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .background(Color.blue600)
                                            .foregroundColor(.white)
                                            .cornerRadius(6)
                                            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.blue50))
                                    }
                                }
                            }
                            .fontWeight(.medium)
                            .foregroundStyle(.white500)
                            .lineLimit(1)
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
        let acept = "Aceptar"
        let reject = "Rechazar"
    }
}
#Preview {
    RequestContactView(isPresented: .constant(false))
}
