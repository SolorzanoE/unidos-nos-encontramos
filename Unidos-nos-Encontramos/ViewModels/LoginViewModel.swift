//
//  LoginViewModel.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Combine

class LoginViewModel: ObservableObject {
    @Published var user: UserResponse?
    
    func login(login: Login) async -> Bool {
        
        do {
            try await ApiService.consume(body: login, method: .post, endpoint: "")
        } catch {
            print(error.localizedDescription)
        }
        
        return false
    }
}
