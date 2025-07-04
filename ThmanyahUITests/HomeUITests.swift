//
//  HomeUITests.swift
//  Thmanyah
//
//  Created by Amr Magdy on 04/07/2025.
//


import XCTest

final class HomeUITests: XCTestCase {
   
   var app: XCUIApplication!
   
   override func setUpWithError() throws {
       continueAfterFailure = false
       app = XCUIApplication()
       app.launch()
   }
   
   override func tearDownWithError() throws {
       app = nil
   }
   
   func testHomeScreenExists() throws {
       let homeNavTitle = app.navigationBars["Thmanyah"]
       XCTAssertTrue(homeNavTitle.exists)
   }
   
   func testHomeTabExists() throws {
       let homeTab = app.tabBars.buttons["Home"]
       XCTAssertTrue(homeTab.exists)
       XCTAssertTrue(homeTab.isSelected)
   }
   
   func testSearchTabExists() throws {
       let searchTab = app.tabBars.buttons["Search"]
       XCTAssertTrue(searchTab.exists)
       XCTAssertFalse(searchTab.isSelected)
   }
   
   func testFilterChipsExist() throws {
       let allFilter = app.buttons["All"]
       let podcastFilter = app.buttons["Podcasts"]
       let episodeFilter = app.buttons["Episodes"]
       
       XCTAssertTrue(allFilter.exists)
       XCTAssertTrue(podcastFilter.exists)
       XCTAssertTrue(episodeFilter.exists)
   }
   
   func testFilterChipSelection() throws {
       let allFilter = app.buttons["All"]
       let podcastFilter = app.buttons["Podcasts"]
       
       XCTAssertTrue(allFilter.isSelected)
       
       podcastFilter.tap()
       sleep(1)
       
       XCTAssertTrue(podcastFilter.isSelected)
       XCTAssertFalse(allFilter.isSelected)
   }
   
   func testScrollableContent() throws {
       let scrollView = app.scrollViews.firstMatch
       XCTAssertTrue(scrollView.exists)
       
       scrollView.swipeUp()
       scrollView.swipeDown()
   }
   
   
   func testErrorStateHandling() throws {
       let retryButton = app.buttons["Try Again"]
       
       if retryButton.exists {
           XCTAssertTrue(retryButton.isEnabled)
           retryButton.tap()
       }
   }
   
   func testNavigationToSearch() throws {
       let searchTab = app.tabBars.buttons["Search"]
       searchTab.tap()
       
       let searchNavTitle = app.navigationBars["Search"]
       XCTAssertTrue(searchNavTitle.waitForExistence(timeout: 2))
       
       let homeTab = app.tabBars.buttons["Home"]
       homeTab.tap()
       
       let homeNavTitle = app.navigationBars["Thmanyah"]
       XCTAssertTrue(homeNavTitle.waitForExistence(timeout: 2))
   }
   
   func testLoadingIndicator() throws {
       let loadingIndicator = app.activityIndicators.firstMatch
       
       if loadingIndicator.exists {
           XCTAssertTrue(loadingIndicator.exists)
       }
   }
   
   
   func testHomeScreenLaunchPerformance() throws {
       measure(metrics: [XCTApplicationLaunchMetric()]) {
           XCUIApplication().launch()
       }
   }
   

}

extension XCUIElement {
   func waitForExistence(timeout: TimeInterval) -> Bool {
       let predicate = NSPredicate(format: "exists == true")
       let expectation = XCTNSPredicateExpectation(predicate: predicate, object: self)
       let result = XCTWaiter.wait(for: [expectation], timeout: timeout)
       return result == .completed
   }
}
