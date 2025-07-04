//
//  MockHomeRepository.swift
//  Thmanyah
//
//  Created by Amr Magdy on 04/07/2025.
//


import Foundation
@testable import Thmanyah

class MockHomeRepository: HomeRepositoryProtocol {
    var mockSections: [Section] = []
    var mockPagination: Pagination?
    var shouldThrowError = false
    var errorToThrow: Error = RepositoryError.networkError(.networkUnavailable)
    var getHomeSectionsCalled = false
    var lastPageRequested: Int?
    
    func getHomeSections(page: Int?) async throws -> (sections: [Section], pagination: Pagination?) {
        getHomeSectionsCalled = true
        lastPageRequested = page
        
        if shouldThrowError {
            throw errorToThrow
        }
        
        return (mockSections, mockPagination)
    }
    
    func reset() {
        mockSections = []
        mockPagination = nil
        shouldThrowError = false
        errorToThrow = RepositoryError.networkError(.networkUnavailable)
        getHomeSectionsCalled = false
        lastPageRequested = nil
    }
}