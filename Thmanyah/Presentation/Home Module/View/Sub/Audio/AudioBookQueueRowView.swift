//
//  AudioBookQueueRowView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import SwiftUI

struct AudioBookQueueRowView: View {
    
    let audioBook: AudioBook
    
    var body: some View {
        HStack(spacing: 12) {
            AsyncImage(url: URL(string: audioBook.coverImageURL ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .overlay {
                        Image(systemName: "book.fill")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
            }
            .frame(width: 50, height: 50)
            .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 2) {
                Text(audioBook.displayTitle)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(1)
                
                Text(audioBook.authorName)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                
                if let rating = audioBook.rating {
                    HStack(spacing: 2) {
                        RatingStarsView(rating: rating)
                        Text(audioBook.formattedRating)
                            .font(.caption2)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            Spacer()
            
            Button(action: {
            }) {
                Image(systemName: "plus.circle")
                    .font(.title3)
                    .foregroundColor(.orange)
            }
        }
        .padding(.vertical, 4)
        .contentShape(Rectangle())
    }
}
