//
//  PersonInformationView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 26/03/25.
//

import SwiftUI

struct PersonInformationView: View {
    
    let fullName: String
    var image: ImageResource?
    
    var body: some View {
        
        ZStack {
            BackgroundComponent(style: .gradientOceanBlue)
            
            VStack(spacing: 15) {
                
                TextComponent(text: fullName, style: .headline)
                    .foregroundStyle(.white50)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 5)
                
                RoundedRectangle(cornerRadius: 30)
                    .stroke(.white50)
                    .frame(maxWidth: 200, maxHeight: 200)
                    .overlay {
                        ZStack {
                            Color.white500
                            if let image = image {
                                Image(image)
                                    .resizable()
                                    .scaledToFill()
                            } else {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.blue500)
                                    .padding(30)
                            }
                        }.frame(maxWidth: 200, maxHeight: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 30))
                    }.shadow(color: .black.opacity(0.25), radius: 5, y: 5)
                    .frame(width: 100, height: 100)
                
                ScrollView {
                    VStack(spacing: 15) {
                        
                        boxInformation(color: .yellow200) {
                            title("Actualizaciones")
                        }
                        
                        boxInformation(color: .blue50) {
                            title("Informacion")
                            
                            body("Edad al momento de la desaparición", description: "18 años")
                            
                            body("Edad actual", description: "20 años")
                            
                            body("Lugar de origen", description: "Tapachula, Chiapas")
                            
                            body("Género", description: "Tapachula, Chiapas")
                            
                            body("Nacionalidad", description: "Mexicana")
                            
                            body("Fecha de los hechos", description: "2 de febrero de 2025")
                            
                            body("Lugar de los hechos", description: "Tapachula, Chiapas")
                            
                            title("Datos")
                            
                            body("Características", description: "Estatura: 1.75m; Tamaño: 24cm")
                            
                            body("Señas particulares", description: "Lunar")
                            
                            body("Prendas de vestir", description: "Sudadera con logo de la UNACH")
                            
                            title("Contactos")
                        }
                    }
                }.scrollIndicators(.hidden)
            }.frame(maxWidth: .infinity)
                .safeAreaInset(edge: .top, alignment: .leading) {
                    NavigationButtonComponent(style: .back) {
                        // Action
                    }
                }.padding(.horizontal)
        }
    }
    
    func title(_ text: String) -> some View {
        TextComponent(text: text, style: .subheadline)
            .fontWeight(.semibold)
            .padding(.vertical, 7)
    }
    
    func body(_ text: String, description: String = "") -> some View {
        Text(text + ": ")
            .font(.custom("Montserrat", size: 16))
            .fontWeight(.medium)
        + Text(description)
            .font(.custom("Montserrat", size: 16))
            .fontWeight(.regular)
    }
    
    // TODO: checar el shadow del fondo
    func boxInformation(color: Color, @ViewBuilder content: () -> some View) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
                .foregroundStyle(.white500)
        }.padding(10)
            .padding(.bottom, 10)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background {
                color.opacity(0.10)
            }
            .clipShape(RoundedRectangle(cornerRadius: 10))
            //.shadow(radius: 1)
    }
}

#Preview {
    PersonInformationView(fullName: "Martin Emmanuel Erants Solórzano")
}
