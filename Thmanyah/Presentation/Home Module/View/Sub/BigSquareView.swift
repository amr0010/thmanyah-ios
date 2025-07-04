//
//  BigSquareView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//


import SwiftUI

struct BigSquareView: View {
    
    let section: Section
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DesignSystem.Spacing.lg) {
                switch section.content {
                case .audioBooks(let audioBooks):
                    ForEach(audioBooks, id: \.id) { audioBook in
                        AudioBookFeaturedCardView(audioBook: audioBook)
                            .frame(width: 320, height: 220)
                    }
                case .episodes(let episodes):
                    ForEach(episodes, id: \.id) { episode in
                        EpisodeFeaturedCardView(episode: episode)
                            .frame(width: 320, height: 220)
                    }
                case .podcasts(let podcasts):
                    ForEach(podcasts, id: \.id) { podcast in
                        PodcastFeaturedCardView(podcast: podcast)
                            .frame(width: 320, height: 220)
                    }
                case .audioArticles(let articles):
                    ForEach(articles, id: \.id) { article in
                        AudioArticleFeaturedCardView(article: article)
                            .frame(width: 320, height: 220)
                    }
                case .none:
                    EmptyView()
                }
            }
            .padding(.horizontal, DesignSystem.Spacing.screenPadding)
        }
    }
}