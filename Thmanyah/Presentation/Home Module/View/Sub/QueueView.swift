//
//  QueueView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct QueueView: View {
    
    let section: Section
    
    var body: some View {
        VStack(spacing: DesignSystem.Spacing.elementSpacing) {
            switch section.content {
            case .podcasts(let podcasts):
                ForEach(podcasts.prefix(5), id: \.id) { podcast in
                    PodcastQueueRowView(podcast: podcast)
                        .padding(.horizontal, DesignSystem.Spacing.xs)
                }
            case .episodes(let episodes):
                ForEach(episodes.prefix(5), id: \.id) { episode in
                    EpisodeQueueRowView(episode: episode)
                        .padding(.horizontal, DesignSystem.Spacing.xs)
                }
            case .audioBooks(let audioBooks):
                ForEach(audioBooks.prefix(5), id: \.id) { audioBook in
                    AudioBookQueueRowView(audioBook: audioBook)
                        .padding(.horizontal, DesignSystem.Spacing.xs)
                }
            case .audioArticles(let articles):
                ForEach(articles.prefix(5), id: \.id) { article in
                    AudioArticleQueueRowView(article: article)
                        .padding(.horizontal, DesignSystem.Spacing.xs)
                }
            case .none:
                EmptyView()
            }
        }
        .padding(.vertical, DesignSystem.Spacing.xs)
        .background(DesignSystem.Colors.surfaceBackground)
        .cornerRadius(DesignSystem.CornerRadius.card)
    }
}
