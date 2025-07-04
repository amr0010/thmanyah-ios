//
//  AudioArticleFeaturedCardView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import SwiftUI

struct AudioArticleFeaturedCardView: View {
    
    let article: AudioArticle
    @State private var isPressed = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: article.imageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                    .fill(DesignSystem.Colors.surfaceBackground)
                    .overlay {
                        Image(systemName: "doc.text.fill")
                            .font(.largeTitle)
                            .foregroundColor(DesignSystem.Colors.articleColor)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            .cornerRadius(DesignSystem.CornerRadius.lg)
            
            DesignSystem.Colors.cardGradient
                .cornerRadius(DesignSystem.CornerRadius.lg)
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                Text(article.displayTitle)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.title3,
                        weight: .bold
                    ))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(article.authorName)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.subheadline,
                        weight: .medium
                    ))
                    .foregroundColor(.white.opacity(0.9))
                    .lineLimit(1)
                
                HStack {
                    Text(article.durationText)
                        .font(DesignSystem.Typography.arabicFont(
                            size: DesignSystem.Typography.caption1,
                            weight: .medium
                        ))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Spacer()
                    
                    if let readingTime = article.readingTime {
                        Text("\(readingTime) min read")
                            .font(DesignSystem.Typography.arabicFont(
                                size: DesignSystem.Typography.caption1,
                                weight: .medium
                            ))
                            .foregroundColor(.white.opacity(0.8))
                    }
                }
                
                if let tags = article.tags, !tags.isEmpty {
                    HStack {
                        ForEach(tags.prefix(2), id: \.self) { tag in
                            Text("#\(tag)")
                                .font(DesignSystem.Typography.arabicFont(
                                    size: DesignSystem.Typography.caption2,
                                    weight: .medium
                                ))
                                .foregroundColor(.white.opacity(0.8))
                                .padding(.horizontal, DesignSystem.Spacing.xs)
                                .padding(.vertical, 2)
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(DesignSystem.CornerRadius.xs)
                        }
                        Spacer()
                    }
                }
            }
            .padding(DesignSystem.Spacing.lg)
        }
    }
}
