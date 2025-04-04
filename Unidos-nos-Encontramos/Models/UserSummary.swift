//
//  UserSummary.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

struct UserSummary: Codable {
    let id: UUID
    let username: String
    let firstName: String
    let lastName: String
    let photoUrl: String
}
