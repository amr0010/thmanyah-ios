//
//  EmptyStateView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct EmptyStateView: View {
    
    let title: String
    let subtitle: String
    let systemImage: String
    let actionTitle: String?
    let actionHandler: (() -> Void)?
    
    init(
        title: String,
        subtitle: String,
        systemImage: String,
        actionTitle: String? = nil,
        actionHandler: (() -> Void)? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.systemImage = systemImage
        self.actionTitle = actionTitle
        self.actionHandler = actionHandler
    }
    
    var body: some View {
        VStack(spacing: DesignSystem.Spacing.xl) {
            Image(systemName: systemImage)
                .font(.system(size: 60, weight: .light))
                .foregroundColor(DesignSystem.Colors.tertiaryText)
                .symbolRenderingMode(.hierarchical)
            
            VStack(spacing: DesignSystem.Spacing.md) {
                Text(title)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.title2,
                        weight: .bold
                    ))
                    .foregroundColor(DesignSystem.Colors.primaryText)
                    .multilineTextAlignment(.center)
                
                Text(subtitle)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.body,
                        weight: .regular
                    ))
                    .foregroundColor(DesignSystem.Colors.secondaryText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, DesignSystem.Spacing.xxxl)
            }
            
            if let actionTitle = actionTitle, let actionHandler = actionHandler {
                Button(actionTitle) {
                    actionHandler()
                }
                .secondaryButtonStyle()
                .padding(.top, DesignSystem.Spacing.md)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DesignSystem.Colors.background)
    }
}

extension EmptyStateView {
    
    static func noHomeSections() -> EmptyStateView {
        EmptyStateView(
            title: "No Content Available",
            subtitle: "There's no content available right now. Check your internet connection and try again.",
            systemImage: "tray",
            actionTitle: "Reload"
        ) {
        }
    }
    
    static func homeLoadingFailed() -> EmptyStateView {
        EmptyStateView(
            title: "Loading Failed",
            subtitle: "An error occurred while loading content. Please try again.",
            systemImage: "exclamationmark.triangle",
            actionTitle: "Try Again"
        ) {
        }
    }
    
    // MARK: - Search Empty States
    static func searchEmpty() -> EmptyStateView {
        EmptyStateView(
            title: "Start Searching",
            subtitle: "Type in the search bar to find podcasts, episodes, audiobooks, and articles.",
            systemImage: "magnifyingglass"
        )
    }
    
    static func noSearchResults(for query: String) -> EmptyStateView {
        EmptyStateView(
            title: "No Results Found",
            subtitle: "We couldn't find any results for \"\(query)\". Try different keywords or check your spelling.",
            systemImage: "doc.text.magnifyingglass",
            actionTitle: "Clear Search"
        ) {
        }
    }
    
    static func searchError() -> EmptyStateView {
        EmptyStateView(
            title: "Search Error",
            subtitle: "An error occurred while searching. Check your internet connection and try again.",
            systemImage: "wifi.exclamationmark",
            actionTitle: "Try Again"
        ) {
        }
    }
    
    static func noPodcasts() -> EmptyStateView {
        EmptyStateView(
            title: "No Podcasts",
            subtitle: "We couldn't find any podcasts in this section right now.",
            systemImage: "mic.slash"
        )
    }
    
    static func noEpisodes() -> EmptyStateView {
        EmptyStateView(
            title: "No Episodes",
            subtitle: "We couldn't find any episodes in this section right now.",
            systemImage: "play.slash"
        )
    }
    
    static func noAudioBooks() -> EmptyStateView {
        EmptyStateView(
            title: "No Audiobooks",
            subtitle: "We couldn't find any audiobooks in this section right now.",
            systemImage: "book.slash"
        )
    }
    
    static func noAudioArticles() -> EmptyStateView {
        EmptyStateView(
            title: "No Audio Articles",
            subtitle: "We couldn't find any audio articles in this section right now.",
            systemImage: "doc.text.slash"
        )
    }
    
    static func noInternet() -> EmptyStateView {
        EmptyStateView(
            title: "No Internet Connection",
            subtitle: "Check your internet connection and try again.",
            systemImage: "wifi.slash",
            actionTitle: "Try Again"
        ) {
        }
    }
  
}

extension EmptyStateView {
    
    static func forHomeState(_ sections: [Section], isLoading: Bool, error: String?) -> EmptyStateView? {
        if !isLoading && sections.isEmpty {
            if let error = error {
                return .homeLoadingFailed()
            } else {
                return .noHomeSections()
            }
        }
        return nil
    }
    
    static func forSearchState(
        query: String,
        results: [Section],
        isLoading: Bool,
        error: String?
    ) -> EmptyStateView? {
        if !isLoading {
            if let error = error {
                return .searchError()
            } else if query.isEmpty {
                return .searchEmpty()
            } else if results.isEmpty {
                return .noSearchResults(for: query)
            }
        }
        return nil
    }
    
    static func forSectionContent(_ section: Section) -> EmptyStateView? {
        guard !section.hasContent else { return nil }
        
        switch section.contentType {
        case .podcast:
            return .noPodcasts()
        case .episode:
            return .noEpisodes()
        case .audioBook:
            return .noAudioBooks()
        case .audioArticle:
            return .noAudioArticles()
        case .none:
            return EmptyStateView(
                title: "No Content",
                subtitle: "There's no content available in this section.",
                systemImage: "tray"
            )
        }
    }
}
