//
//  UserResponse.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//
import Foundation

struct UserResponse: Codable, Equatable {
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
    let photoUrl: String?
    let distinctiveFeatures: [UserFeature]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(UUID.self, forKey: .id)
        username = try container.decode(String.self, forKey: .username)
        email = try container.decode(String.self, forKey: .email)
        firstName = try container.decode(String.self, forKey: .firstName)
        lastName = try container.decode(String.self, forKey: .lastName)
        motherLastName = try container.decodeIfPresent(String.self, forKey: .motherLastName)
        nationality = try container.decode(Catalog.self, forKey: .nationality)
        
        let dateString = try container.decode(String.self, forKey: .birthdate)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        guard let date = formatter.date(from: dateString) else {
            throw DecodingError.dataCorruptedError(forKey: .birthdate, in: container, debugDescription: "Formato de fecha inválido")
        }
        birthdate = date
        
        birthPlaceState = try container.decode(Catalog.self, forKey: .birthPlaceState)
        birthPlaceMunicipality = try container.decode(Catalog.self, forKey: .birthPlaceMunicipality)
        sex = try container.decode(Catalog.self, forKey: .sex)
        gender = try container.decode(Catalog.self, forKey: .gender)
        curp = try container.decodeIfPresent(String.self, forKey: .curp)
        phone = try container.decodeIfPresent(String.self, forKey: .phone)
        street = try container.decodeIfPresent(String.self, forKey: .street)
        state = try container.decode(Catalog.self, forKey: .state)
        municipality = try container.decode(Catalog.self, forKey: .municipality)
        postalCode = try container.decodeIfPresent(String.self, forKey: .postalCode)
        height = try container.decode(Decimal.self, forKey: .height)
        weight = try container.decode(Decimal.self, forKey: .weight)
        eyeColor = try container.decode(Catalog.self, forKey: .eyeColor)
        skinColor = try container.decode(Catalog.self, forKey: .skinColor)
        bodyType = try container.decode(Catalog.self, forKey: .bodyType)
        hairType = try container.decode(Catalog.self, forKey: .hairType)
        photoUrl = try container.decodeIfPresent(String.self, forKey: .photoUrl)
        distinctiveFeatures = try container.decode([UserFeature].self, forKey: .distinctiveFeatures)
    }
}
