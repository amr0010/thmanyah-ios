//
//  DIContainer.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

class DIContainer {
    static let shared = DIContainer()
    private init() {}
    
    lazy var apiClient: APIClientProtocol = {
        APIClient()
    }()
    
    lazy var homeRepository: HomeRepositoryProtocol = {
        HomeRepository(apiClient: apiClient)
    }()
    
    lazy var searchRepository: SearchRepositoryProtocol = {
        SearchRepository(apiClient: apiClient)
    }()
    
    lazy var getHomeSectionsUseCase: GetHomeSectionsUseCaseProtocol = {
        GetHomeSectionsUseCase(homeRepository: homeRepository)
    }()
    
    lazy var searchContentUseCase: SearchContentUseCaseProtocol = {
        SearchContentUseCase(searchRepository: searchRepository)
    }()
    
    @MainActor func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(getHomeSectionsUseCase: getHomeSectionsUseCase)
    }
    
    @MainActor func makeSearchViewModel() -> SearchViewModel {
        return SearchViewModel(searchContentUseCase: searchContentUseCase)
    }
    
}
