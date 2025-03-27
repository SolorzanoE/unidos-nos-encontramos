//
//  LoginView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 26/03/25.
//

import SwiftUI

struct LoginView: View {
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            BackgroundComponent(style: .gradientSkyBlue)
            
            VStack {
                
                TextField("", text: .constant("aaa"))
                
                TextField("", text: .constant("aaa"))
                
                TextComponent(text: "Olvidé mi contraseña", style: .callout)
                    .foregroundStyle(.blue400)
                
                Button("Iniciar Sesion") {
                    
                }.padding(.vertical)
                
                customDivider()
                
                VStack(spacing: 20) {
                    LogExternButtonComponent(style: .google)
                    
                    LogExternButtonComponent(style: .apple)
                    
                    LogExternButtonComponent(style: .facebook)
                }
                    
                customDivider()

                footer()
            }.padding(.horizontal)
                .padding(.vertical, 25)
                .frame(maxWidth: .infinity)
                .background(.white500)
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20))
        }.ignoresSafeArea(edges: .bottom)
    }
    
    func footer() -> some View {
        HStack(spacing: 5) {
            Text("¿No tienes una cuenta?")
            
            Button("Crear una cuenta nueva") {
                
            }.foregroundStyle(.blue400)
        }.font(.custom("Montserrat", size: 13))
            .foregroundStyle(.grey500)
    }
    
    func customDivider() -> some View {
        Rectangle()
            .frame(height: 1)
            .padding(.vertical)
    }
}

#Preview {
    LoginView()
}
