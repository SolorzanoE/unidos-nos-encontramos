//
//  ContactResponse.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

struct ContactResponse: Codable {
    let id: UUID
    let user: UserSummary
    let contactUser: UserSummary
    let status: ContactStatus
    let userKinship: String
    let contactUserKinship: String
    let userFavorite: Bool
    let contactUserFavorite: Bool
    let createdAt: Date
    let updatedAt: Date
}

enum ContactStatus: Codable {
    case PENDING, ACCEPTED, REJECTED
}
