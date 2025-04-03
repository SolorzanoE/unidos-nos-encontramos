//
//  RouteResponse.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

struct RouteResponse: Codable {
    let id: UUID
    let user: UserSummary
    let startLat: Decimal
    let startLng: Decimal
    let endLat: Decimal
    let endLng: Decimal
    let status: RouteStatus
    let estimatedArrivalTime: Date?
    let totalDistance: Decimal
    let createdAt: Date
    let lastUpdateTime: Date
    let contacts: [RouteContactResponse]
    let currentLocation: LocationResponse
}

enum RouteStatus: Codable {
    case ACTIVE
    case COMPLETED
    case SUSPENDED
    case SUSPICIOUS
}
