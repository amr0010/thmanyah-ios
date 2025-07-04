//
//  SearchSection.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import Foundation

struct SearchSection: Identifiable, Equatable {
    let id: String
    let title: String?
    let items: [SearchItem]
    
    var displayTitle: String {
        return title ?? "Search Results"
    }
    
    var itemsCount: Int {
        return items.count
    }
    
    var hasContent: Bool {
        return !items.isEmpty
    }
}
