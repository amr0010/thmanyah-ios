//
//  HomeViewModelTests.swift
//  Thmanyah
//
//  Created by Amr Magdy on 04/07/2025.
//

import XCTest
@testable import Thmanyah

@MainActor
final class HomeViewModelTests: XCTestCase {
    
    var viewModel: HomeViewModel!
    var mockUseCase: MockGetHomeSectionsUseCase!
    
    override func setUp() {
        super.setUp()
        mockUseCase = MockGetHomeSectionsUseCase()
        viewModel = HomeViewModel(getHomeSectionsUseCase: mockUseCase)
    }
    
    override func tearDown() {
        viewModel = nil
        mockUseCase = nil
        super.tearDown()
    }
    
    func testInitialState() {
        XCTAssertTrue(viewModel.sections.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertNil(viewModel.pagination)
        XCTAssertFalse(viewModel.isLoadingMore)
    }
    
    func testLoadHomeSectionsSuccess() async {
        let mockSections = [TestDataFactory.createMockSection()]
        let mockPagination = TestDataFactory.createMockPagination()
        
        mockUseCase.mockSections = mockSections
        mockUseCase.mockPagination = mockPagination
        
        await viewModel.loadHomeSections()
        
        XCTAssertEqual(viewModel.sections.count, 1)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.errorMessage)
        XCTAssertNotNil(viewModel.pagination)
    }
    
    func testLoadHomeSectionsError() async {
        mockUseCase.shouldThrowError = true
        mockUseCase.errorToThrow = RepositoryError.networkError(.networkUnavailable)
        
        await viewModel.loadHomeSections()
        
        XCTAssertTrue(viewModel.sections.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNotNil(viewModel.errorMessage)
    }
    
    func testLoadMoreSections() async {
        viewModel.sections = [TestDataFactory.createMockSection(name: "Existing")]
        viewModel.pagination = TestDataFactory.createMockPagination(hasNextPage: true)
        
        let newSections = [TestDataFactory.createMockSection(name: "New")]
        mockUseCase.mockSections = newSections
        
        await viewModel.loadMoreSections()
        
        XCTAssertEqual(viewModel.sections.count, 2)
        XCTAssertFalse(viewModel.isLoadingMore)
    }
    
    func testRetryLoading() async {
        viewModel.sections = []
        viewModel.errorMessage = "Test Error"
        
        let mockSections = [TestDataFactory.createMockSection()]
        mockUseCase.mockSections = mockSections
        
        await viewModel.retryLoading()
        
        XCTAssertEqual(viewModel.sections.count, 1)
        XCTAssertNil(viewModel.errorMessage)
    }
}
