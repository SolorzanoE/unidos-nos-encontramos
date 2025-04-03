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
    @Published var login: Login = Login(user: "", password: "")
    
    func login(login: Login) async -> Bool {
        
        do {
            let data = try await ApiService.consume(body: login, method: .post, endpoint: "http://localhost:8085/api/users/login")
            
            let decoder = JSONDecoder()
            
            let userData = try decoder.decode(UserResponse.self, from: data)
            
            user = userData
            
            return true
        } catch {
            print(error.localizedDescription)
        }
        
        return false
    }
}
