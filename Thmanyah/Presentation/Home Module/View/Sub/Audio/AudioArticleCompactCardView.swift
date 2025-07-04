//
//  AudioArticleCompactCardView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct AudioArticleCompactCardView: View {
    
    let article: AudioArticle
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: DesignSystem.Spacing.md) {
            AsyncImage(url: URL(string: article.imageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.sm)
                    .fill(DesignSystem.Colors.surfaceBackground)
                    .overlay {
                        Image(systemName: "doc.text.fill")
                            .foregroundColor(DesignSystem.Colors.articleColor)
                    }
            }
            .frame(width: 60, height: 60)
            .clipped()
            .cornerRadius(DesignSystem.CornerRadius.sm)
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(article.displayTitle)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.subheadline,
                        weight: .medium
                    ))
                    .foregroundColor(DesignSystem.Colors.primaryText)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(article.authorName)
                    .cardCaptionStyle()
                    .lineLimit(1)
                
                HStack {
                    Text(article.durationText)
                        .font(DesignSystem.Typography.arabicFont(
                            size: DesignSystem.Typography.caption2,
                            weight: .medium
                        ))
                        .foregroundColor(DesignSystem.Colors.articleColor)
                    
                    if let readingTime = article.readingTime {
                        Text("• \(readingTime) min read")
                            .font(DesignSystem.Typography.arabicFont(
                                size: DesignSystem.Typography.caption2,
                                weight: .regular
                            ))
                            .foregroundColor(DesignSystem.Colors.secondaryText)
                    }
                }
                
                Spacer(minLength: 0)
            }
            
            Spacer()
        }
        .padding(DesignSystem.Spacing.cardPadding)
        .background(DesignSystem.Colors.cardBackground)
        .cornerRadius(DesignSystem.CornerRadius.card)
        .shadow(
            color: DesignSystem.Shadows.card.color,
            radius: DesignSystem.Shadows.card.radius,
            x: DesignSystem.Shadows.card.x,
            y: DesignSystem.Shadows.card.y
        )
    }
}


