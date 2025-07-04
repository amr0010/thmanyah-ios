//
//  EpisodeFeaturedCardView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct EpisodeFeaturedCardView: View {
    
    let episode: Episode
    @State private var isPressed = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: episode.imageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                    .fill(DesignSystem.Colors.surfaceBackground)
                    .overlay {
                        Image(systemName: "play.circle")
                            .font(.largeTitle)
                            .foregroundColor(DesignSystem.Colors.episodeColor)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            .cornerRadius(DesignSystem.CornerRadius.lg)
            
            DesignSystem.Colors.cardGradient
                .cornerRadius(DesignSystem.CornerRadius.lg)
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                Text(episode.displayTitle)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.title3,
                        weight: .bold
                    ))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                HStack {
                    if let podcastTitle = episode.podcastTitle {
                        Text(podcastTitle)
                            .font(DesignSystem.Typography.arabicFont(
                                size: DesignSystem.Typography.caption1,
                                weight: .medium
                            ))
                            .foregroundColor(.white.opacity(0.8))
                    }
                    
                    Spacer()
                    
                    Text(episode.durationText)
                        .font(DesignSystem.Typography.arabicFont(
                            size: DesignSystem.Typography.caption1,
                            weight: .medium
                        ))
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            .padding(DesignSystem.Spacing.lg)
            
            PlayButtonView(size: 50) {
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        }
    }
}
