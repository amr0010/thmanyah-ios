//
//  SearchRepository.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

final class SearchRepository: SearchRepositoryProtocol {
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func searchContent(query: String) async throws -> [SearchSection] {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedQuery.isEmpty else {
            return []
        }
        
        do {
            let response = try await apiClient.request(
                .search(query: trimmedQuery),
                responseType: SearchResponse.self
            )
            
            let sections = SearchMapper.mapSearchResponse(response)
            
            return sections
            
        } catch let networkError as NetworkError {
            throw RepositoryError.networkError(networkError)
        } catch {
            throw RepositoryError.mappingError
        }
    }
}
