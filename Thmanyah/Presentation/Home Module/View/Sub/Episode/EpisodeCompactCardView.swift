//
//  EpisodeCompactCardView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct EpisodeCompactCardView: View {
    
    let episode: Episode
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: DesignSystem.Spacing.md) {
            ZStack(alignment: .center) {
                AsyncImage(url: URL(string: episode.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.sm)
                        .fill(DesignSystem.Colors.surfaceBackground)
                        .overlay {
                            Image(systemName: "play.circle")
                                .foregroundColor(DesignSystem.Colors.episodeColor)
                        }
                }
                .frame(width: 60, height: 60)
                .clipped()
                .cornerRadius(DesignSystem.CornerRadius.sm)
                
                PlayButtonView(size: 30) {
                }
            }
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(episode.displayTitle)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.subheadline,
                        weight: .medium
                    ))
                    .foregroundColor(DesignSystem.Colors.primaryText)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                if let podcastTitle = episode.podcastTitle {
                    Text(podcastTitle)
                        .cardCaptionStyle()
                        .lineLimit(1)
                }
                
                Text(episode.durationText)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.caption2,
                        weight: .medium
                    ))
                    .foregroundColor(DesignSystem.Colors.episodeColor)
                
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
