//
//  HomeViewModel.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation
import SwiftUI

// MARK: - Home ViewModel
@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var sections: [Section] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var pagination: Pagination?
    @Published var isLoadingMore = false
    
    private let getHomeSectionsUseCase: GetHomeSectionsUseCaseProtocol
    private var currentPage = 1
    private var canLoadMore: Bool {
        pagination?.hasNextPage ?? false
    }
    
    init(getHomeSectionsUseCase: GetHomeSectionsUseCaseProtocol) {
        self.getHomeSectionsUseCase = getHomeSectionsUseCase
    }
    
    // MARK: - Public Methods
    func loadHomeSections() async {
        guard !isLoading else { return }
        
        isLoading = true
        errorMessage = nil
        currentPage = 1
        
        do {
            let (sections, pagination) = try await getHomeSectionsUseCase.execute(page: currentPage)
            self.sections = sections
            self.pagination = pagination
        } catch {
            handleError(error)
            self.sections = []
        }
        
        isLoading = false
    }
    
    func loadMoreSections() async {
        guard !isLoadingMore && canLoadMore else { return }
        
        isLoadingMore = true
        let nextPage = currentPage + 1
        
        do {
            let (newSections, newPagination) = try await getHomeSectionsUseCase.execute(page: nextPage)
            self.sections.append(contentsOf: newSections)
            self.pagination = newPagination
            self.currentPage = nextPage
        } catch {
            handleError(error)
        }
        
        isLoadingMore = false
    }
    
    func refreshSections() async {

    }
    
    func retryLoading() async {
        if sections.isEmpty {
            await loadHomeSections()
        } else {
            await refreshSections()
        }
    }
    
    // MARK: - Computed Properties
    var isEmpty: Bool {
        return sections.isEmpty && !isLoading
    }
    
    var hasError: Bool {
        return errorMessage != nil && sections.isEmpty
    }
    
    var shouldShowLoadMore: Bool {
        return canLoadMore && !sections.isEmpty && !isLoadingMore
    }
    
    var emptyState: EmptyStateView? {
        return EmptyStateView.forHomeState(sections, isLoading: isLoading, error: errorMessage)
    }
    
    private func handleError(_ error: Error) {
        if let repositoryError = error as? RepositoryError {
            switch repositoryError {
            case .networkError(let networkError):
                self.errorMessage = networkError.localizedDescription
            case .mappingError:
                self.errorMessage = "Failed to process data"
            case .noData:
                self.errorMessage = "No data available"
            }
        } else {
            self.errorMessage = error.localizedDescription
        }
    }
}
