//
//  PersonReportedBoxComponent.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 26/03/25.
//

import SwiftUI

struct PersonReportedBoxComponent: View {
    let name: String
    let gender: String
    let dateSucess: String
    let edad: Int
    let picture: String?
    var body: some View {
        VStack{
            if let picture = picture{
                Image(picture)
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .frame(minWidth: 156, minHeight: 120)
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.blue600)
                    .padding()
                    .frame(minWidth: 156, minHeight: 120)
            }
            TextComponent(text: name, style: .body)
                .fontWeight(.medium)
                .foregroundStyle(.grey500)
            Divider()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: 1.5)
                .background(Color.grey900)
                .padding(.horizontal)
            HStack{
                VStack(alignment: .leading) {
                    TextComponent(text: "Edad actual: \(edad) años", style: .callout)
                    TextComponent(text: "Género: \(gender)", style: .callout)
                    TextComponent(text: "Fecha de los hechos: \(dateSucess)", style: .callout)
                }.fontWeight(.light)
                    .padding(.trailing)
                
            }
        }
        .background(Color.grey50)
        .clipShape(RoundedRectangle(cornerRadius: 5))
        .frame(width: 163, height: 243)
        .shadow(radius: 4, y: 4)
        
    }
}

#Preview {
    PersonReportedBoxComponent(name: "Emmanuel Erants", gender: "Masculino", dateSucess: "02/02/2025", edad: 19, picture: nil)
}
