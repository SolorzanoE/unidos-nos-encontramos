//
//  LocationUpdate.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

struct LocationUpdate: Codable {
    let latitude: Decimal
    let longitude: Decimal
    let speed: Double
    let accuracy: Double
    let batteryLevel: Int
}
