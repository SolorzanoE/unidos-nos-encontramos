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
        
        if method != .get, method != .delete {
            let encode = JSONEncoder()

            do {
                urlRequest.httpBody = try encode.encode(body)
            } catch {
                print("No se pudo castear a JSON")
            }
        }
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        if let httpResponse = response as? HTTPURLResponse {
            let statusCode = httpResponse.statusCode
            
            if statusCode != 200 {
                throw URLError(URLError.Code.unknown)
            }
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
