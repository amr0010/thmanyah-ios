//
//  PodcastCompactCardView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import SwiftUI

struct PodcastCompactCardView: View {
    
    let podcast: Podcast
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: DesignSystem.Spacing.md) {
            AsyncImage(url: URL(string: podcast.imageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.sm)
                    .fill(DesignSystem.Colors.surfaceBackground)
                    .overlay {
                        Image(systemName: "waveform")
                            .foregroundColor(DesignSystem.Colors.podcastColor)
                    }
            }
            .frame(width: 60, height: 60)
            .clipped()
            .cornerRadius(DesignSystem.CornerRadius.sm)
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(podcast.displayTitle)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.subheadline,
                        weight: .medium
                    ))
                    .foregroundColor(DesignSystem.Colors.primaryText)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(podcast.episodeCountText)
                    .cardCaptionStyle()
                
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
