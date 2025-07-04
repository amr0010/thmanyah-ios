//
//  SearchContentUseCaseProtocol.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

final class SearchContentUseCase: SearchContentUseCaseProtocol {
    
    private let searchRepository: SearchRepositoryProtocol
    
    init(searchRepository: SearchRepositoryProtocol) {
        self.searchRepository = searchRepository
    }
    
    func execute(query: String) async throws -> [SearchSection] {
        let trimmedQuery = query.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !trimmedQuery.isEmpty && trimmedQuery.count >= 2 else {
            return []
        }
        
        let sections = try await searchRepository.searchContent(query: trimmedQuery)
        
        return sections.filter { $0.hasContent }
    }
}
