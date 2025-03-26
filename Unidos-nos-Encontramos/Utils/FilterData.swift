//
//  FilterData.swift
//  Unidos-nos-Encontramos
//
//  Created by Eduardo Solórzano Santos on 25/03/25.
//

import SwiftUI

struct FilterData<T> {
    
    // Palabra o letra que ayuda a realizar el filtrado
    @Binding var keyword: String

    let data: [T]
    
    var filter: [T] {
        
        var result: [T] = []
        
        for information in data {
            
            // Recorremos cada una de las propiedades del objeto propuesto
            let value = Mirror(reflecting: information).children.map { mirror in
                return "\(mirror.value)".lowercased()
            }
            
            if keyword.contains(value.joined().lowercased()) {
                result.append(information)
            }
        
        }
            
        return result
    }
}
