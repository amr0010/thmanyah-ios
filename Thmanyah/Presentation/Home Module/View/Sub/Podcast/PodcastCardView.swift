//
//  PodcastCardView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct PodcastCardView: View {
    
    let podcast: Podcast
    @State private var isPressed = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
            AsyncImage(url: URL(string: podcast.imageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.image)
                    .fill(DesignSystem.Colors.surfaceBackground)
                    .overlay {
                        Image(systemName: "waveform")
                            .font(.title)
                            .foregroundColor(DesignSystem.Colors.podcastColor)
                    }
            }
            .frame(height: 120)
            .clipped()
            .cornerRadius(DesignSystem.CornerRadius.image)
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(podcast.displayTitle)
                    .cardTitleStyle()
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(podcast.episodeCountText)
                    .cardCaptionStyle()
                    .lineLimit(1)
            }
            .padding()
        }
        .cardStyle()       
    }
}
