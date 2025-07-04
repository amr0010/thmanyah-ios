//
//  Pagination.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct Pagination: Equatable {
    let nextPageURL: String?
    let totalPages: Int?
    let currentPage: Int?
    let itemsPerPage: Int?
    
    var hasNextPage: Bool {
        return nextPageURL != nil
    }
    
    var nextPageNumber: Int? {
        guard let nextPageURL = nextPageURL,
              let url = URL(string: nextPageURL),
              let components = URLComponents(url: url, resolvingAgainstBaseURL: false),
              let pageItem = components.queryItems?.first(where: { $0.name == "page" }),
              let pageValue = pageItem.value,
              let pageNumber = Int(pageValue) else {
            return nil
        }
        return pageNumber
    }
    
    var progressText: String {
        guard let currentPage = currentPage,
              let totalPages = totalPages else {
            return ""
        }
        return "Page \(currentPage) of \(totalPages)"
    }
}
