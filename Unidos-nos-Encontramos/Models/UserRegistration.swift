//
//  UserRegistration.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

struct UserRegistration: Codable {
    let username: String
    let email: String
    let password: String
    let firstName: String
    let lastName: String
    let motherLastName: String?
    let nationalityId: Int
    let birthdate: Date
    let birthPlaceStateId: Int
    let birthPlaceMunicipalityId: Int
    let sexId: Int
    let genderId: Int
    let curp: String
    let phone: String
    let street: String
    let stateId: Int
    let municipalityId: Int
    let postalCode: String
    let height: Decimal
    let weight: Decimal
    let eyeColorId: Int
    let skinColorId: Int
    let bodyTypeId: Int
    let hairTypeId: Int
    let distinctiveFeatures: [DistinctiveFeatureRequest]?
}
