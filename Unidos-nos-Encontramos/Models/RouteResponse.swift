//
//  RouteResponse.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

struct RouteResponse: Codable {
    let id: UUID
    let user: User
    let startLat: Decimal
    let startLng: Decimal
    let endLat: Decimal
    let endLng: Decimal
    
}
