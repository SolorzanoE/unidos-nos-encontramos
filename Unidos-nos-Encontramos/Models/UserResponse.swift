//
//  UserResponse.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

struct UserResponse: Codable {
    let id: UUID
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let motherLastName: String?
    let nationality: Catalog
    let birthdate: Date
    let birthPlaceState: Catalog
    let birthPlaceMunicipality: Catalog
    let sex: Catalog
    let gender: Catalog
    let curp: String?
    let phone: String?
    let street: String?
    let state: Catalog
    let municipality: Catalog
    let postalCode: String?
    let height: Decimal
    let weight: Decimal
    let eyeColor: Catalog
    let skinColor: Catalog
    let bodyType: Catalog
    let hairType: Catalog
    let distinctiveFeatures: [UserFeature]
}
