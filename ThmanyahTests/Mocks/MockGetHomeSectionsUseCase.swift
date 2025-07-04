//
//  MockGetHomeSectionsUseCase.swift
//  Thmanyah
//
//  Created by Amr Magdy on 04/07/2025.
//


import Foundation
@testable import Thmanyah

class MockGetHomeSectionsUseCase: GetHomeSectionsUseCaseProtocol {
    var mockSections: [Section] = []
    var mockPagination: Pagination?
    var shouldThrowError = false
    var errorToThrow: Error = RepositoryError.networkError(.networkUnavailable)
    var executeCalled = false
    var executeCallCount = 0
    var lastPageRequested: Int?
    
    func execute(page: Int?) async throws -> (sections: [Section], pagination: Pagination?) {
        executeCalled = true
        executeCallCount += 1
        lastPageRequested = page
        
        
        if shouldThrowError {
            throw errorToThrow
        }
        
        return (mockSections, mockPagination)
    }
    
    
    func reset() {
        executeCalled = false
        executeCallCount = 0
        lastPageRequested = nil
        shouldThrowError = false
        errorToThrow = RepositoryError.networkError(.networkUnavailable)
        mockSections = []
        mockPagination = nil
    }
}
