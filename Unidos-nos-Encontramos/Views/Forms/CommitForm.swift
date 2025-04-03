//
//  CommitForm.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import SwiftUI

struct CommitForm: View {
    
    @State private var cellphone: String = ""
    @State private var email: String = ""
    @State private var address: String = ""
    
    var body: some View {
        
        ZStack {
            
            BackgroundComponent(style: .white)
            
            VStack(spacing: 17) {
                
                VStack {
                    
                    HStack {
                        TextComponent(text: "Terminos y Condiciones", style: .subheadline)
                            .foregroundStyle(.grey500)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.backward")
                                .fontWeight(.bold)
                                .rotationEffect(.degrees(-90))
                                .foregroundStyle(.grey900)
                        }
                    }
                        
                }.padding()
                    .background(.white500)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.25), radius: 5, y: 3)
                
                VStack {
                    
                    HStack {
                        TextComponent(text: "Avisos de Privacidad", style: .subheadline)
                            .foregroundStyle(.grey500)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button {
                            
                        } label: {
                            Image(systemName: "chevron.backward")
                                .fontWeight(.bold)
                                .rotationEffect(.degrees(-90))
                                .foregroundStyle(.grey900)
                        }
                    }
                }.padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.white500)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(color: .black.opacity(0.25), radius: 5, y: 3)
                
                HStack {
                    TextComponent(text: "He leído y acepto los Términos y Condiciones junto con las Políticas de Privacidad", style: .callout)
                        .foregroundStyle(.grey500)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    RoundedRectangle(cornerRadius: 2)
                        .stroke()
                        .foregroundStyle(.grey400)
                        .frame(width: 18, height: 18)
                }
            }
        }
    }
}

#Preview {
    CommitForm()
}
