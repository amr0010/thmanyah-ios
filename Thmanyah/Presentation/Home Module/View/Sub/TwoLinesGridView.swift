//
//  TwoLinesGridView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//


import SwiftUI

struct TwoLinesGridView: View {
    
    let section: Section
    
    private let columns = [
        GridItem(.flexible(), spacing: DesignSystem.Spacing.cardSpacing),
        GridItem(.flexible(), spacing: DesignSystem.Spacing.cardSpacing)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: DesignSystem.Spacing.cardSpacing) {
            switch section.content {
            case .episodes(let episodes):
                ForEach(episodes.prefix(6), id: \.id) { episode in
                    EpisodeCompactCardView(episode: episode)
                        .frame(height: 130)
                }
            case .audioBooks(let audioBooks):
                ForEach(audioBooks.prefix(6), id: \.id) { audioBook in
                    AudioBookCompactCardView(audioBook: audioBook)
                        .frame(height: 130)
                }
            case .podcasts(let podcasts):
                ForEach(podcasts.prefix(6), id: \.id) { podcast in
                    PodcastCompactCardView(podcast: podcast)
                        .frame(height: 130)
                }
            case .audioArticles(let articles):
                ForEach(articles.prefix(6), id: \.id) { article in
                    AudioArticleCompactCardView(article: article)
                        .frame(height: 130)
                }
            case .none:
                EmptyView()
            }
        }
    }
}
