//
//  ApiService.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 03/04/25.
//

import Foundation

class ApiService {
    
    private init() {}
    
    static func consume<T: Codable>(body: T?, method: HTTPMethod, endpoint: String) async throws -> Data {
        guard let endpoint = URL(string: endpoint) else {
            throw URLError(.badURL)
        }
        
        var urlRequest = URLRequest(url: endpoint)
        
        urlRequest.httpMethod = method.rawValue
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if method != .get && method != .delete, let body = body {
            urlRequest.httpBody = try JSONEncoder().encode(body)
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw URLError(.cannotParseResponse)
        }
        
        if httpResponse.statusCode != 200 && httpResponse.statusCode != 204 {
            throw URLError(.badServerResponse)
        }
        
        return data
    }
    
    enum HTTPMethod: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
        case patch = "PATCH"
    }
}

let baseURL = "http://localhost:8085/api"
