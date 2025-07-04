//
//  HTTPMethod.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//


import Foundation

enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

enum Endpoint {
    case homeSections(page: Int?)
    case search(query: String)
    
    var baseURL: String {
        switch self {
        case .homeSections:
            return "https://api-v2-b2sit6oh3a-uc.a.run.app"
        case .search:
            return "https://mock.apidog.com/m1/735111-711675-default"
        }
    }
    
    var path: String {
        switch self {
        case .homeSections:
            return "/home_sections"
        case .search:
            return "/search"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .homeSections, .search:
            return .GET
        }
    }
    
    var queryItems: [URLQueryItem]? {
        switch self {
        case .homeSections(let page):
            guard let page = page else { return nil }
            return [URLQueryItem(name: "page", value: "\(page)")]
        case .search(let query):
            return [URLQueryItem(name: "q", value: query)]
        }
    }
    
    var headers: [String: String] {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
}