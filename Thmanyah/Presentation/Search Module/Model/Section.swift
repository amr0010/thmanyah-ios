//
//  Section.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct Section: Identifiable, Equatable {
    let id = UUID()
    let title: String?
    let layoutType: SectionType?
    let contentType: ContentType?
//    let order: Int?
    let content: SectionContent?
    
    var displayTitle: String {
        return title ?? "Unknown Section"
    }
    
    var itemsCount: Int {
        switch content {
        case .podcasts(let items):
            return items.count
        case .episodes(let items):
            return items.count
        case .audioBooks(let items):
            return items.count
        case .audioArticles(let items):
            return items.count
        case .none:
            return 0
        }
    }
    
    var hasContent: Bool {
        return itemsCount > 0
    }
}

enum SectionContent: Equatable {
    case podcasts([Podcast])
    case episodes([Episode])
    case audioBooks([AudioBook])
    case audioArticles([AudioArticle])
}
