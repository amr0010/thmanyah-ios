//
//  NetworkError.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//


import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case noData
    case invalidResponse
    case decodingError(Error)
    case serverError(Int)
    case networkUnavailable
    case timeout
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .noData:
            return "No data received"
        case .invalidResponse:
            return "Invalid response"
        case .decodingError(let error):
            return "Decoding failed: \(error.localizedDescription)"
        case .serverError(let code):
            return "Server error with code: \(code)"
        case .networkUnavailable:
            return "Network unavailable"
        case .timeout:
            return "Request timeout"
        case .unknown(let error):
            return "Unknown error: \(error.localizedDescription)"
        }
    }
}

