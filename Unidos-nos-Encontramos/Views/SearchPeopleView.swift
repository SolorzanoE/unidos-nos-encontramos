//
//  ReportedPersonsView.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 26/03/25.
//

import SwiftUI

struct SearchPeopleView: View {
    
    let reportedPersons: [PersonReportedBoxComponent] = [
        PersonReportedBoxComponent(name: "Emmanuel Erants", gender: "Masculino", dateSucess: "02/02/2025", edad: 19, picture: "Person"),
        PersonReportedBoxComponent(name: "Ana López", gender: "Femenino", dateSucess: "15/08/2023", edad: 25, picture: "Person"),
        PersonReportedBoxComponent(name: "Carlos Pérez", gender: "Masculino", dateSucess: "10/11/2022", edad: 30, picture: "Person"),
        PersonReportedBoxComponent(name: "María González", gender: "Femenino", dateSucess: "05/06/2021", edad: 22, picture: "Person")
    ]
    
    let columns = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        
        ZStack {
            
            VStack(alignment: .leading){
                SearchComponent(text:"Búsqueda inteligente", placeholder: "")
                    .foregroundStyle(.grey900)
                    .padding(.bottom,15)
                TextComponent(text: "Personas reportadas desaparecidas", style: .subheadline)
                    .fontWeight(.semibold)
                    .padding(.bottom,4)
                Button(action: {
                }) {
                    TextComponent(text: "Tapachula - Chiapas", style: .body)
                        .fontWeight(.medium)
                        .padding(6)
                        .foregroundColor(.white500)
                        .frame(minWidth: 186, minHeight: 32)
                        .background(Color.blue600)
                        .cornerRadius(10)
                }
                .padding(.bottom)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 17) {
                        ForEach(reportedPersons, id: \.name) { person in
                            person
                        }
                    }
                }
                
                
            }.padding(.horizontal)
            
        }
        .background(Color.white500)
        .safeAreaInset(edge: .bottom, content: {
        })
    }
}

#Preview {
    SearchPeopleView()
}
