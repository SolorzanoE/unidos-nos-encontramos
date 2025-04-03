//
//  DeviceRegistration.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

struct DeviceRegistration: Codable {
    let userId: UUID
    let deviceToken: String
    let deviceType: DeviceType
}

enum DeviceType: Codable {
    case IOS
    case ANDROID
}
