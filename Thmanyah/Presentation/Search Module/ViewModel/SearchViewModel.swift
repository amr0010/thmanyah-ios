//
//  SearchViewModel.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation
import Combine

@MainActor
class SearchViewModel: ObservableObject {
    
    @Published var searchQuery: String = "" {
        didSet {
            handleSearchQueryChange()
        }
    }
    @Published var sections: [SearchSection] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let searchContentUseCase: SearchContentUseCaseProtocol
    private var searchTask: Task<Void, Never>?
    private var cancellables = Set<AnyCancellable>()
    private var lastSearchQuery: String = ""

    
    var shouldShowResults: Bool {
        return !searchQuery.isEmpty && !sections.isEmpty
    }
    
    var isEmpty: Bool {
        return sections.isEmpty && !isLoading && !searchQuery.isEmpty
    }
    
    var hasError: Bool {
        return errorMessage != nil
    }
    
    var emptyState: EmptyStateView? {
        if searchQuery.isEmpty {
            return EmptyStateView.searchEmpty()
        } else if isEmpty && !isLoading {
            return EmptyStateView.noSearchResults(for: searchQuery)
        }
        return nil
    }
    
    init(searchContentUseCase: SearchContentUseCaseProtocol) {
        self.searchContentUseCase = searchContentUseCase
    }
    
    func clearSearch() {
        searchQuery = ""
        sections = []
        errorMessage = nil
        searchTask?.cancel()
    }
    
    func retrySearch() async {
        guard !searchQuery.isEmpty else { return }
        await performSearch()
    }
    
    private func handleSearchQueryChange() {
            let trimmedQuery = searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
            
            guard trimmedQuery != lastSearchQuery else { return }
            
            searchTask?.cancel()
            errorMessage = nil
            
            guard !trimmedQuery.isEmpty else {
                sections = []
                lastSearchQuery = trimmedQuery
                return
            }
                        
            searchTask = Task {
                try? await Task.sleep(for: .milliseconds(200))
                
                guard !Task.isCancelled else { return }
                guard trimmedQuery == searchQuery.trimmingCharacters(in: .whitespacesAndNewlines) else { return }
                
                lastSearchQuery = trimmedQuery
                await performSearch()
            }
        }
    
    private func performSearch() async {
        let query = searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard !query.isEmpty, query.count >= 2 else {
            sections = []
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        do {
            let searchResults = try await searchContentUseCase.execute(query: query)
            
            guard query == searchQuery.trimmingCharacters(in: .whitespacesAndNewlines) else {
                return
            }
            
            sections = searchResults
            
        } catch {
            guard query == searchQuery.trimmingCharacters(in: .whitespacesAndNewlines) else {
                return
            }
            
            sections = []
            
            if let repositoryError = error as? RepositoryError {
                switch repositoryError {
                case .networkError(let networkError):
                    switch networkError {
                    case .networkUnavailable:
                        errorMessage = "No internet connection"
                    case .timeout:
                        errorMessage = "Search timed out"
                    case .serverError(let code):
                        errorMessage = "Server error (\(code))"
                    default:
                        errorMessage = "Search failed"
                    }
                case .mappingError:
                    errorMessage = "Invalid search response"
                case .noData:
                    errorMessage = "No search results found"
                }
            } else {
                errorMessage = "Search failed"
            }
        }
        
        isLoading = false
    }
}
