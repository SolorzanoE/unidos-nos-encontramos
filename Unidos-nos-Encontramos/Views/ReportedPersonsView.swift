//
//  ReportedPersonsView.swift
//  Unidos-nos-Encontramos
//
//  Created by Martín Emmanuel Erants Solórzano on 26/03/25.
//

import SwiftUI

struct ReportedPersonsView: View {
    var body: some View {
        
        ZStack {
            VStack(alignment: .leading){
                SearchComponent(text: "a")
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
                
                //LazyVGrid(columns: ){
                
                //}
                
                
            }.padding(.horizontal)
            
        }
    }
}

#Preview {
    ReportedPersonsView()
}
