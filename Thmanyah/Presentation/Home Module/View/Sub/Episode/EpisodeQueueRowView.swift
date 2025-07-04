//
//  EpisodeQueueRowView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct EpisodeQueueRowView: View {
    
    let episode: Episode
    
    var body: some View {
        HStack(spacing: 12) {
            ZStack {
                AsyncImage(url: URL(string: episode.imageURL ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    Circle()
                        .fill(Color.gray.opacity(0.3))
                        .overlay {
                            Image(systemName: "play.circle")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                }
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                
                Image(systemName: "play.fill")
                    .font(.caption)
                    .foregroundColor(.white)
                    .background(
                        Circle()
                            .fill(Color.black.opacity(0.6))
                            .frame(width: 20, height: 20)
                    )
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(episode.displayTitle)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .lineLimit(1)
                
                if let podcastTitle = episode.podcastTitle {
                    Text(podcastTitle)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                }
            }
            
            Spacer()
            
            Text(episode.durationText)
                .font(.caption2)
                .foregroundColor(.blue)
            
            Button(action: {
            }) {
                Image(systemName: "play.circle")
                    .font(.title3)
                    .foregroundColor(.blue)
            }
        }
        .padding(.vertical, 4)
        .contentShape(Rectangle())
    }
}
