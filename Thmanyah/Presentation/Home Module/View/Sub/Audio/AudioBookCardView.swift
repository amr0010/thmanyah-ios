//
//  AudioBookCardView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct AudioBookCardView: View {
    
    let audioBook: AudioBook
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            AsyncImage(url: URL(string: audioBook.coverImageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.gray.opacity(0.3))
                    .overlay {
                        Image(systemName: "book.fill")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
            }
            .frame(height: 120)
            .clipped()
            .cornerRadius(12)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(audioBook.displayTitle)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                
                Text(audioBook.authorName)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                if let rating = audioBook.rating {
                    HStack(spacing: 4) {
                        RatingStarsView(rating: rating)
                        Text(audioBook.formattedRating)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
            }
        }
    }
}



