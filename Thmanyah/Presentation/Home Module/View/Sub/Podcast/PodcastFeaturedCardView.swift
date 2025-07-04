//
//  PodcastFeaturedCardView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import SwiftUI

struct PodcastFeaturedCardView: View {
    
    let podcast: Podcast
    @State private var isPressed = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: podcast.imageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                    .fill(DesignSystem.Colors.surfaceBackground)
                    .overlay {
                        Image(systemName: "waveform")
                            .font(.largeTitle)
                            .foregroundColor(DesignSystem.Colors.podcastColor)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            .cornerRadius(DesignSystem.CornerRadius.lg)
            
            DesignSystem.Colors.cardGradient
                .cornerRadius(DesignSystem.CornerRadius.lg)
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                Text(podcast.displayTitle)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.title3,
                        weight: .bold
                    ))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    Text(podcast.episodeCountText)
                        .font(DesignSystem.Typography.arabicFont(
                            size: DesignSystem.Typography.caption1,
                            weight: .medium
                        ))
                        .foregroundColor(.white.opacity(0.8))
                    
                    Spacer()
                    
                    Text(podcast.durationText)
                        .font(DesignSystem.Typography.arabicFont(
                            size: DesignSystem.Typography.caption1,
                            weight: .medium
                        ))
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            .padding(DesignSystem.Spacing.lg)
        }
    }
}
