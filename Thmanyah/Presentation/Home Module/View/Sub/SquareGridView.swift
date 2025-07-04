//
//  SquareGridView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//


import SwiftUI

struct SquareGridView: View {
    
    let section: Section
    
    private let columns = [
        GridItem(.flexible(), spacing: DesignSystem.Spacing.cardSpacing),
        GridItem(.flexible(), spacing: DesignSystem.Spacing.cardSpacing)
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: columns, spacing: DesignSystem.Spacing.cardSpacing) {
                switch section.content {
                case .podcasts(let podcasts):
                    ForEach(podcasts, id: \.id) { podcast in
                        PodcastCardView(podcast: podcast)
                            .frame(width: 160, height: 200)
                    }
                case .audioBooks(let audioBooks):
                    ForEach(audioBooks, id: \.id) { audioBook in
                        AudioBookCardView(audioBook: audioBook)
                            .frame(width: 160, height: 200)
                    }
                case .audioArticles(let articles):
                    ForEach(articles, id: \.id) { article in
                        AudioArticleCardView(article: article)
                            .frame(width: 160, height: 120)
                    }
                case .episodes(let episodes):
                    ForEach(episodes, id: \.id) { episode in
                        EpisodeCardView(episode: episode)
                            .frame(width: 160, height: 200)
                    }
                case .none:
                    EmptyView()
                }
            }
            .padding(.horizontal, DesignSystem.Spacing.screenPadding)
        }
        .frame(height: 420)
    }
}
