//
//  LocationResponse.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

struct LocationResponse: Codable {
    let latitude: Decimal
    let longitude: Decimal
    let speed: Double
    let timestamp: Date
    let remainingDistance: Double
    let estimatedTimeRemaining: Int
}
