//
//  Route.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

struct Route: Codable {
    let startLat: Decimal
    let startLng: Decimal
    let endLat: Decimal
    let estimatedArrivalTime: Date?
    let suspiciousThreshold: Int
    let arrivalRadiusMeters: Decimal
    let contacts: [RouteContact]
}
