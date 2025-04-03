//
//  RouteContactResponse.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

struct RouteContactResponse: Codable {
    let user: UserSummary
    let notificationInterval: Int
    let lastNotifiedAt: Date
}
