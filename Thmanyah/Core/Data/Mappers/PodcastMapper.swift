//
//  PodcastMapper.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct PodcastMapper {
    
    static func map(_ dto: ContentItemDTO) -> Podcast? {
        guard let id = dto.podcastId else { return nil }
        
        return Podcast(
            id: id,
            title: dto.name,
            description: dto.description,
            imageURL: dto.avatarUrl,
            episodeCount: dto.episodeCount,
            totalDuration: dto.duration,
            language: dto.language,
//            priority: dto.priority,
//            popularityScore: dto.popularityScore
        )
    }
}
