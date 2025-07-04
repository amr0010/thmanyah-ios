//
//  GetHomeSectionsUseCaseProtocol.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

final class GetHomeSectionsUseCase: GetHomeSectionsUseCaseProtocol {
    
    private let homeRepository: HomeRepositoryProtocol
    
    init(homeRepository: HomeRepositoryProtocol) {
        self.homeRepository = homeRepository
    }
    
    func execute(page: Int?) async throws -> (sections: [Section], pagination: Pagination?) {
        let (sections, pagination) = try await homeRepository.getHomeSections(page: page)
        
        let processedSections = sections
            .filter { $0.hasContent }
        
        return (processedSections, pagination)
    }
}
