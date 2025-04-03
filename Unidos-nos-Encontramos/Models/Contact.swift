//
//  Contact.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 02/04/25.
//

import Foundation

struct Contact: Codable {
    let contactId: UUID
    let userID: UUID
    let otherUserId: UUID
    let otherUser: OtherUser
    let miKinship: String
    let therKinship: String
    let createdAt: Date
    let status: Status
    let myDefaultNotificationInterval: Int
    let otherDefaultNotificationInterval: Int
    let notificationsEnabled: Bool
    let otherNotificationsEnabled: Bool
    let favoriteByMe: Bool
    let favoriteByThem: Bool
}
