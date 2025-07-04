//
//  PodcastQueueRowView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import SwiftUI

struct PodcastQueueRowView: View {
    
    let podcast: Podcast
    @State private var isPressed = false
    
    var body: some View {
        HStack(spacing: DesignSystem.Spacing.md) {
            AsyncImage(url: URL(string: podcast.imageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Circle()
                    .fill(DesignSystem.Colors.surfaceBackground)
                    .overlay {
                        Image(systemName: "waveform")
                            .font(.caption)
                            .foregroundColor(DesignSystem.Colors.podcastColor)
                    }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(podcast.displayTitle)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.subheadline,
                        weight: .medium
                    ))
                    .foregroundColor(DesignSystem.Colors.primaryText)
                    .lineLimit(1)
                
                Text(podcast.episodeCountText)
                    .cardCaptionStyle()
            }
            
            Spacer()
            
            Button(action: {
            }) {
                Image(systemName: "plus.circle.fill")
                    .font(.title3)
                    .foregroundColor(DesignSystem.Colors.podcastColor)
            }
        }
        .padding(.vertical, DesignSystem.Spacing.xs)
        .contentShape(Rectangle())
    }
}
