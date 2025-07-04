//
//  ContentTypeBadge.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct ContentTypeBadge: View {
    
    let contentType: ContentType
    
    var body: some View {
        HStack(spacing: DesignSystem.Spacing.xs) {
            Image(systemName: iconName)
                .font(.system(size: DesignSystem.Typography.caption2, weight: .medium))
            
            Text(displayName)
                .font(DesignSystem.Typography.arabicFont(
                    size: DesignSystem.Typography.caption2,
                    weight: .medium
                ))
        }
        .padding(.horizontal, DesignSystem.Spacing.sm)
        .padding(.vertical, DesignSystem.Spacing.xs)
        .background(backgroundColor)
        .foregroundColor(foregroundColor)
        .cornerRadius(DesignSystem.CornerRadius.badge)
    }
    
    private var iconName: String {
        switch contentType {
        case .podcast:
            return "mic.fill"
        case .episode:
            return "play.fill"
        case .audioBook:
            return "book.fill"
        case .audioArticle:
            return "doc.text.fill"
        }
    }
    
    private var displayName: String {
        switch contentType {
        case .podcast:
            return "بودكاست"
        case .episode:
            return "حلقة"
        case .audioBook:
            return "كتاب صوتي"
        case .audioArticle:
            return "مقال صوتي"
        }
    }
    
    private var backgroundColor: Color {
        switch contentType {
        case .podcast:
            return DesignSystem.Colors.podcastColor.opacity(0.1)
        case .episode:
            return DesignSystem.Colors.episodeColor.opacity(0.1)
        case .audioBook:
            return DesignSystem.Colors.audiobookColor.opacity(0.1)
        case .audioArticle:
            return DesignSystem.Colors.articleColor.opacity(0.1)
        }
    }
    
    private var foregroundColor: Color {
        switch contentType {
        case .podcast:
            return DesignSystem.Colors.podcastColor
        case .episode:
            return DesignSystem.Colors.episodeColor
        case .audioBook:
            return DesignSystem.Colors.audiobookColor
        case .audioArticle:
            return DesignSystem.Colors.articleColor
        }
    }
}
