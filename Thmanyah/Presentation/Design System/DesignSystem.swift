//
//  DesignSystem.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

// MARK: - Design System
struct DesignSystem {
    
    // MARK: - Colors
    struct Colors {
        
        // MARK: - Primary Colors
        static let primary = Color("PrimaryColor") // Deep blue/purple from screenshot
        static let secondary = Color("SecondaryColor") // Orange accent
        static let accent = Color("AccentColor") // Green play buttons
        
        // MARK: - Background Colors
        static let background = Color("BackgroundColor")
        static let cardBackground = Color("CardBackground")
        static let surfaceBackground = Color("SurfaceBackground")
        
        // MARK: - Text Colors
        static let primaryText = Color("PrimaryText")
        static let secondaryText = Color("SecondaryText")
        static let tertiaryText = Color("TertiaryText")
        
        // MARK: - Content Type Colors
        static let podcastColor = Color("PodcastColor") // Purple
        static let episodeColor = Color("EpisodeColor") // Green
        static let audiobookColor = Color("AudiobookColor") // Orange
        static let articleColor = Color("ArticleColor") // Blue
        
        // MARK: - Status Colors
        static let successColor = Color("SuccessColor")
        static let warningColor = Color("WarningColor")
        static let errorColor = Color("ErrorColor")
        
        // MARK: - Overlay Colors
        static let overlayLight = Color.black.opacity(0.3)
        static let overlayMedium = Color.black.opacity(0.5)
        static let overlayDark = Color.black.opacity(0.7)
        
        // MARK: - Gradient Colors
        static let cardGradient = LinearGradient(
            colors: [Color.clear, Color.black.opacity(0.8)],
            startPoint: .top,
            endPoint: .bottom
        )
        
        static let heroGradient = LinearGradient(
            colors: [
                Color("PrimaryColor").opacity(0.1),
                Color("SecondaryColor").opacity(0.1)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    // MARK: - Typography
    struct Typography {
        
        // MARK: - Arabic Font Family
        static let arabicFontFamily = "SF Arabic"
        static let englishFontFamily = "SF Pro"
        
        // MARK: - Font Sizes
        static let largeTitle: CGFloat = 34
        static let title1: CGFloat = 28
        static let title2: CGFloat = 22
        static let title3: CGFloat = 20
        static let headline: CGFloat = 17
        static let body: CGFloat = 17
        static let callout: CGFloat = 16
        static let subheadline: CGFloat = 15
        static let footnote: CGFloat = 13
        static let caption1: CGFloat = 12
        static let caption2: CGFloat = 11
        
        // MARK: - Font Weights
        static let ultraLight = Font.Weight.ultraLight
        static let thin = Font.Weight.thin
        static let light = Font.Weight.light
        static let regular = Font.Weight.regular
        static let medium = Font.Weight.medium
        static let semibold = Font.Weight.semibold
        static let bold = Font.Weight.bold
        static let heavy = Font.Weight.heavy
        static let black = Font.Weight.black
        
        // MARK: - Custom Fonts
        static func arabicFont(size: CGFloat, weight: Font.Weight = .regular) -> Font {
            return .custom(arabicFontFamily, size: size, relativeTo: .body)
                .weight(weight)
        }
        
        static func englishFont(size: CGFloat, weight: Font.Weight = .regular) -> Font {
            return .custom(englishFontFamily, size: size, relativeTo: .body)
                .weight(weight)
        }
        
        // MARK: - Predefined Styles
        static let navigationTitle = arabicFont(size: title1, weight: .bold)
        static let sectionTitle = arabicFont(size: title2, weight: .bold)
        static let cardTitle = arabicFont(size: headline, weight: .semibold)
        static let cardSubtitle = arabicFont(size: subheadline, weight: .medium)
        static let cardCaption = arabicFont(size: caption1, weight: .regular)
        static let buttonText = arabicFont(size: callout, weight: .medium)
        static let bodyText = arabicFont(size: body, weight: .regular)
    }
    
    // MARK: - Spacing
    struct Spacing {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 20
        static let xxl: CGFloat = 24
        static let xxxl: CGFloat = 32
        
        // MARK: - Section Spacing
        static let sectionSpacing: CGFloat = 24
        static let cardSpacing: CGFloat = 12
        static let elementSpacing: CGFloat = 8
        
        // MARK: - Padding
        static let screenPadding: CGFloat = 16
        static let cardPadding: CGFloat = 12
        static let buttonPadding: CGFloat = 16
    }
    
    // MARK: - Corner Radius
    struct CornerRadius {
        static let xs: CGFloat = 4
        static let sm: CGFloat = 8
        static let md: CGFloat = 12
        static let lg: CGFloat = 16
        static let xl: CGFloat = 20
        static let xxl: CGFloat = 24
        
        // MARK: - Component Radius
        static let card: CGFloat = 12
        static let button: CGFloat = 8
        static let badge: CGFloat = 6
        static let image: CGFloat = 12
    }
    
    // MARK: - Shadows
    struct Shadows {
        static let card = Shadow(
            color: Color.black.opacity(0.1),
            radius: 8,
            x: 0,
            y: 2
        )
        
        static let button = Shadow(
            color: Color.black.opacity(0.15),
            radius: 4,
            x: 0,
            y: 2
        )
        
        static let modal = Shadow(
            color: Color.black.opacity(0.2),
            radius: 20,
            x: 0,
            y: 10
        )
    }
}

// MARK: - Shadow Helper
struct Shadow {
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
}

// MARK: - Design System Extensions
extension View {
    // MARK: - Card Styling
    func cardStyle() -> some View {
        self
            .background(DesignSystem.Colors.cardBackground)
            .cornerRadius(DesignSystem.CornerRadius.card)
            .shadow(
                color: DesignSystem.Shadows.card.color,
                radius: DesignSystem.Shadows.card.radius,
                x: DesignSystem.Shadows.card.x,
                y: DesignSystem.Shadows.card.y
            )
    }
    
    // MARK: - Button Styling
    func primaryButtonStyle() -> some View {
        self
            .font(DesignSystem.Typography.buttonText)
            .foregroundColor(.white)
            .padding(.horizontal, DesignSystem.Spacing.lg)
            .padding(.vertical, DesignSystem.Spacing.md)
            .background(DesignSystem.Colors.primary)
            .cornerRadius(DesignSystem.CornerRadius.button)
    }
    
    func secondaryButtonStyle() -> some View {
        self
            .font(DesignSystem.Typography.buttonText)
            .foregroundColor(DesignSystem.Colors.primary)
            .padding(.horizontal, DesignSystem.Spacing.lg)
            .padding(.vertical, DesignSystem.Spacing.md)
            .background(DesignSystem.Colors.primary.opacity(0.1))
            .cornerRadius(DesignSystem.CornerRadius.button)
    }
    
    // MARK: - Typography Styling
    func navigationTitleStyle() -> some View {
        self
            .font(DesignSystem.Typography.navigationTitle)
            .foregroundColor(DesignSystem.Colors.primaryText)
    }
    
    func sectionTitleStyle() -> some View {
        self
            .font(DesignSystem.Typography.sectionTitle)
            .foregroundColor(DesignSystem.Colors.primaryText)
    }
    
    func cardTitleStyle() -> some View {
        self
            .font(DesignSystem.Typography.cardTitle)
            .foregroundColor(DesignSystem.Colors.primaryText)
    }
    
    func cardSubtitleStyle() -> some View {
        self
            .font(DesignSystem.Typography.cardSubtitle)
            .foregroundColor(DesignSystem.Colors.secondaryText)
    }
    
    func cardCaptionStyle() -> some View {
        self
            .font(DesignSystem.Typography.cardCaption)
            .foregroundColor(DesignSystem.Colors.tertiaryText)
    }
    
    // MARK: - Content Type Colors
    func contentTypeColor(_ contentType: ContentType) -> Color {
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
