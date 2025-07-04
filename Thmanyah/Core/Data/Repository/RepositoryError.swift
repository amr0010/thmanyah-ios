//
//  RepositoryError.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

enum RepositoryError: Error, LocalizedError {
    case networkError(NetworkError)
    case mappingError
    case noData
    
    var errorDescription: String? {
        switch self {
        case .networkError(let networkError):
            return networkError.localizedDescription
        case .mappingError:
            return "Failed to process data"
        case .noData:
            return "No data available"
        }
    }
}
