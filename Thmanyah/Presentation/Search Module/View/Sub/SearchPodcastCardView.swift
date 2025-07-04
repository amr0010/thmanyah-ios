//
//  SearchPodcastCardView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct SearchItemCardView: View {
    
    let item: SearchItem
    @State private var isPressed = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
            ZStack(alignment: .bottomTrailing) {
                AsyncImage(url: URL(string: item.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.image)
                        .fill(DesignSystem.Colors.surfaceBackground)
                        .overlay {
                            Image(systemName: "waveform")
                                .font(.title2)
                                .foregroundColor(DesignSystem.Colors.primary)
                        }
                }
                .frame(height: 100)
                .clipped()
                .cornerRadius(DesignSystem.CornerRadius.image)
                
                if let episodeCount = item.episodeCount {
                    Text("\(episodeCount)")
                        .font(DesignSystem.Typography.arabicFont(
                            size: DesignSystem.Typography.caption2,
                            weight: .bold
                        ))
                        .foregroundColor(.white)
                        .padding(.horizontal, DesignSystem.Spacing.xs)
                        .padding(.vertical, 2)
                        .background(DesignSystem.Colors.primary)
                        .cornerRadius(DesignSystem.CornerRadius.xs)
                        .padding(DesignSystem.Spacing.xs)
                }
            }
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(item.displayTitle)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.subheadline,
                        weight: .semibold
                    ))
                    .foregroundColor(DesignSystem.Colors.primaryText)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                if !item.durationText.isEmpty {
                    Text(item.durationText)
                        .font(DesignSystem.Typography.arabicFont(
                            size: DesignSystem.Typography.caption1,
                            weight: .medium
                        ))
                        .foregroundColor(DesignSystem.Colors.primary)
                }
            }
        }
        .padding(DesignSystem.Spacing.sm)
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
