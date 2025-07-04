//
//  APIConstants.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//


import Foundation

struct APIConstants {
    
    struct Timeout {
        static let request: TimeInterval = 30.0
        static let resource: TimeInterval = 60.0
    }
    
    struct RetryPolicy {
        static let maxRetries = 3
        static let retryDelay: TimeInterval = 1.0
    }
    
    struct Pagination {
        static let defaultPageSize = 20
        static let maxPageSize = 100
    }
    
    struct Search {
        static let debounceDelay: TimeInterval = 0.2
        static let minQueryLength = 2
        static let maxQueryLength = 100
    }
    
    struct Headers {
        static let contentType = "Content-Type"
        static let accept = "Accept"
        static let userAgent = "User-Agent"
        static let authorization = "Authorization"
    }
    
    struct ContentType {
        static let json = "application/json"
        static let formURLEncoded = "application/x-www-form-urlencoded"
    }
    
    struct UserAgent {
        static let value = "Thmanyah/1.0 (iOS; Swift)"
    }
}