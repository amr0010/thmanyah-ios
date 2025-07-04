//
//  AudioBookMapper.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct AudioBookMapper {
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    static func map(_ dto: ContentItemDTO) -> AudioBook? {
        guard let id = dto.audiobookId else { return nil }
        
        let releaseDate = dto.releaseDate.flatMap { dateFormatter.date(from: $0) }
        
        return AudioBook(
            id: id,
            title: dto.name,
            author: dto.authorName,
            description: dto.description,
            coverImageURL: dto.avatarUrl,
            duration: dto.duration,
            language: dto.language,
            releaseDate: releaseDate,
            rating: dto.rating,
            ratingCount: dto.ratingCount,
            narrator: dto.narrator,
            publisher: dto.publisher,
            category: dto.category
        )
    }
}
