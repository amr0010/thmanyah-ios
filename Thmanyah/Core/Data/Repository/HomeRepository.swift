//
//  HomeRepository.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

final class HomeRepository: HomeRepositoryProtocol {
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func getHomeSections(page: Int?) async throws -> (sections: [Section], pagination: Pagination?) {
        do {
            let response = try await apiClient.request(
                .homeSections(page: page),
                responseType: HomeSectionsResponse.self
            )
            
            let (sections, pagination) = SectionMapper.mapHomeSectionsResponse(response)
            
            return (sections, pagination)
            
        } catch let networkError as NetworkError {
            throw RepositoryError.networkError(networkError)
        } catch {
            throw RepositoryError.mappingError
        }
    }
}
