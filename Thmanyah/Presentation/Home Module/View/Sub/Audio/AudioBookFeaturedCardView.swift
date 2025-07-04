//
//  AudioBookFeaturedCardView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import SwiftUI

struct AudioBookFeaturedCardView: View {
    
    let audioBook: AudioBook
    @State private var isPressed = false
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: audioBook.coverImageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                    .fill(DesignSystem.Colors.surfaceBackground)
                    .overlay {
                        Image(systemName: "book.fill")
                            .font(.largeTitle)
                            .foregroundColor(DesignSystem.Colors.audiobookColor)
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            .cornerRadius(DesignSystem.CornerRadius.lg)
            
            DesignSystem.Colors.cardGradient
                .cornerRadius(DesignSystem.CornerRadius.lg)
            
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.sm) {
                Text(audioBook.displayTitle)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.title3,
                        weight: .bold
                    ))
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(audioBook.authorName)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.subheadline,
                        weight: .medium
                    ))
                    .foregroundColor(.white.opacity(0.9))
                    .lineLimit(1)
                
                HStack {
                    if let rating = audioBook.rating {
                        HStack(spacing: DesignSystem.Spacing.xs) {
                            RatingStarsView(rating: rating)
                            Text(audioBook.formattedRating)
                                .font(DesignSystem.Typography.arabicFont(
                                    size: DesignSystem.Typography.caption1,
                                    weight: .medium
                                ))
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                    
                    Spacer()
                    
                    Text(audioBook.durationText)
                        .font(DesignSystem.Typography.arabicFont(
                            size: DesignSystem.Typography.caption1,
                            weight: .medium
                        ))
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            .padding()
        }       
    }
}
