//
//  RequestBuilder.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//


import Foundation

struct RequestBuilder {
    
    static func buildRequest(from endpoint: Endpoint) throws -> URLRequest {
        guard var urlComponents = URLComponents(string: endpoint.baseURL + endpoint.path) else {
            throw NetworkError.invalidURL
        }
        
        urlComponents.queryItems = endpoint.queryItems
        
        guard let url = urlComponents.url else {
            throw NetworkError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.timeoutInterval = 30.0
        
        endpoint.headers.forEach { key, value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        
        return request
    }
    
    static func buildRequest<T: Encodable>(
        from endpoint: Endpoint,
        body: T
    ) throws -> URLRequest {
        var request = try buildRequest(from: endpoint)
        
        do {
            let jsonData = try JSONEncoder().encode(body)
            request.httpBody = jsonData
        } catch {
            throw NetworkError.decodingError(error)
        }
        
        return request
    }
}