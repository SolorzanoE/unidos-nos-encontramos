//
//  NotificationResponse.swift
//  Unidos-nos-Encontramos
//
//  Created by macbook on 03/04/25.
//

import Foundation

struct NotificationResponse: Codable, Identifiable {
    let id: UUID
    let type: NotificationType
    let message: String
    let relatedReportId: UUID?
    let relatedRouteId: UUID?
    let createdAt: Date?
    let read: Bool
    
    enum NotificationType: String, Codable {
        case ROUTE_INFO
        case ROUTE_CHECK
        case MISSING_REPORT
        case CONTACT_REQUEST
        case SAFETY_CONFIRMATION
    }
    
    enum CodingKeys: String, CodingKey {
        case id, type, message, relatedReportId, relatedRouteId, createdAt, read
    }
}
