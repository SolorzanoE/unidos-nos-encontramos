//
//  LoginViewModel.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Combine
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var user: UserResponse?
    @Published var credentials: Login = Login(user: "", password: "")
    
    func login(credentials: Login) async -> Bool {
        
        do {
            let data = try await ApiService.consume(
                body: credentials,
                method: .post,
                endpoint: "http://localhost:8085/api/users/login"
            )
                        
            let userData = try JSONDecoder().decode(UserResponse.self, from: data)
            
            await MainActor.run { user = userData }
            return true
        } catch {
            print("Error: \(error.localizedDescription)")
            return false
        }
    }
}
