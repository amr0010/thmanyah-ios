//
//  AudioArticleCardView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct AudioArticleCardView: View {
    
    let article: AudioArticle
    @State private var isPressed = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
            ZStack(alignment: .topTrailing) {
                AsyncImage(url: URL(string: article.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.image)
                        .fill(DesignSystem.Colors.surfaceBackground)
                        .overlay {
                            Image(systemName: "doc.text.fill")
                                .font(.title)
                                .foregroundColor(DesignSystem.Colors.articleColor)
                        }
                }
                .frame(height: 120)
                .clipped()
                .cornerRadius(DesignSystem.CornerRadius.image)
                
                if let readingTime = article.readingTime {
                    DurationBadgeView(
                        duration: "\(readingTime) min",
                        backgroundColor: DesignSystem.Colors.articleColor.opacity(0.8)
                    )
                    .padding(DesignSystem.Spacing.sm)
                }
            }
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(article.displayTitle)
                    .cardTitleStyle()
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(article.authorName)
                    .cardCaptionStyle()
                    .lineLimit(1)
            }
        }
        .cardStyle()
    }
}
