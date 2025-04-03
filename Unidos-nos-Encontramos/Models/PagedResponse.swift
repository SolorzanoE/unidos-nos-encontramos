//
//  PagedResponse.swift
//  Unidos-nos-Encontramos
//
//  Created by macbook on 03/04/25.
//

struct PagedResponse<T: Codable>: Codable {
    let content: [T]
    let pageable: PageableInfo
    let totalElements: Int
    let totalPages: Int
    let last: Bool
    let first: Bool
    let empty: Bool
    
    struct PageableInfo: Codable {
        let pageNumber: Int
        let pageSize: Int
    }
}
