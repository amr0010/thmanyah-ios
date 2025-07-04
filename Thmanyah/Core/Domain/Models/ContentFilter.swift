//
//  ContentFilter.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation
import SwiftUI

struct ContentFilter: Identifiable, Equatable {
    let id = UUID()
    let type: FilterType
    let displayName: String
    let icon: String?
    let accentColor: Color
    
    static let all = ContentFilter(
        type: .all,
        displayName: "All",
        icon: nil,
        accentColor: DesignSystem.Colors.articleColor
    )
    
    static let podcasts = ContentFilter(
        type: .contentType(.podcast),
        displayName: "Podcasts",
        icon: "mic.fill",
        accentColor: DesignSystem.Colors.podcastColor
    )
    
    static let episodes = ContentFilter(
        type: .contentType(.episode),
        displayName: "Episodes",
        icon: "play.fill",
        accentColor: DesignSystem.Colors.episodeColor
    )
    
    static let audioBooks = ContentFilter(
        type: .contentType(.audioBook),
        displayName: "Audiobooks",
        icon: "book.fill",
        accentColor: DesignSystem.Colors.audiobookColor
    )
    
    static let audioArticles = ContentFilter(
        type: .contentType(.audioArticle),
        displayName: "Audio Articles",
        icon: "doc.text.fill",
        accentColor: DesignSystem.Colors.articleColor
    )
    
    static let defaultFilters: [ContentFilter] = [
        .all, .podcasts, .episodes, .audioBooks, .audioArticles
    ]
}

enum FilterType: Equatable {
    case all
    case contentType(ContentType)
    
    func matches(_ section: Section) -> Bool {
        switch self {
        case .all:
            return true
        case .contentType(let contentType):
            return section.contentType == contentType
        }
    }
}
