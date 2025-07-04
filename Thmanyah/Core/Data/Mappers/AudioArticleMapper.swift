//
//  AudioArticleMapper.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct AudioArticleMapper {
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    static func map(_ dto: ContentItemDTO) -> AudioArticle? {
        guard let id = dto.articleId else { return nil }
        
        let publishedDate = dto.releaseDate.flatMap { dateFormatter.date(from: $0) }
        
        return AudioArticle(
            id: id,
            title: dto.name,
            author: dto.authorName,
            description: dto.description,
            imageURL: dto.avatarUrl,
            duration: dto.duration,
            publishedDate: publishedDate,
            source: dto.source,
            category: dto.category,
            audioURL: dto.audioUrl,
            originalArticleURL: dto.originalArticleUrl,
            readingTime: dto.estimatedReadingTime,
            viewCount: dto.viewCount,
            tags: dto.tags ?? dto.keywords
        )
    }
}
