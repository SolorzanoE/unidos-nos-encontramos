//
//  LoginView.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 26/03/25.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = "usuario@ejemplo.com"
    @State private var password = "Contraseña123!"
    @State private var showPassword = false
    @State private var isCreateNewAccount = false
    @AppStorage("isLogged") var isLogged = false
    
    @EnvironmentObject private var loginViewModel: LoginViewModel
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            BackgroundComponent(style: .gradientSkyBlue)
            
            VStack {
                
                FieldComponent(type: .textField, name: "Correo Electrónico", placeholder: "Ingresa tu correo", text: $email, fontSize: .body)
                
                VStack(alignment: .trailing, spacing: 10) {
                    
                    FieldComponent(type: .secureField(.show), name: "Contraseña", placeholder: "Ingresa tu contraseña", text: $password, fontSize: .body)
                        .keyboardType(.emailAddress)
                    
                    TextComponent(text: "Olvidé mi contraseña", style: .callout)
                        .fontWeight(.medium)
                        .foregroundStyle(.blue400)
                }.padding(.vertical, 10)
                
                JourneyButtonComponent(text: "Iniciar Sesión") {
                    Task {
                        do {
                            let isLoggedResult = await loginViewModel.login(
                                login: Login(user: email, password: password)
                            )
                            self.isLogged = isLoggedResult
                        }
                            
                            
                        }
                }.padding(.top, 10)
                
                DividerComponent()
                    .padding(.vertical)
                
                VStack(spacing: 20) {
                    LogExternButtonComponent(style: .google)
                    
                    LogExternButtonComponent(style: .apple)
                    
                    LogExternButtonComponent(style: .facebook)
                }.padding(.horizontal)
                
                DividerComponent()
                    .padding(.vertical)
                
                footer()
            }.padding(.horizontal)
                .padding(.bottom, 25)
                .padding(.top, 30)
                .background(.white500)
                .clipShape(UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20))
                .shadow(color: .black.opacity(0.5), radius: 10)
        }.ignoresSafeArea(edges: .bottom)
            .fullScreenCover(isPresented: $isCreateNewAccount) {
                SignUpView(isPresent: $isCreateNewAccount)
            }
    }
    
    func footer() -> some View {
        HStack(spacing: 5) {
            Text("¿No tienes una cuenta?")
            
            Button("Crear una cuenta nueva") {
                isCreateNewAccount.toggle()
            }.foregroundStyle(.blue400)
        }.font(.custom("Montserrat", size: 13))
            .foregroundStyle(.grey500)
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewModel())
}
