//
//  SearchMapper.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import Foundation

struct SearchMapper {
    
    static func mapSearchResponse(_ response: SearchResponse) -> [SearchSection] {
        return response.sections?.compactMap { sectionDTO in
            mapSearchSection(sectionDTO)
        } ?? []
    }
    
    private static func mapSearchSection(_ dto: SearchSectionDTO) -> SearchSection? {
        let items = dto.content.compactMap { itemDTO in
            mapSearchItem(itemDTO)
        }
        
        guard !items.isEmpty else { return nil }
        
        let id = dto.name ?? UUID().uuidString
        
        return SearchSection(
            id: id,
            title: dto.name,
            items: items
        )
    }
    
    private static func mapSearchItem(_ dto: SearchContentItemDTO) -> SearchItem? {
        guard let id = dto.podcastId else { return nil }
        
        let episodeCount: Int?
        if let episodeCountString = dto.episodeCount {
            episodeCount = Int(episodeCountString)
        } else {
            episodeCount = nil
        }
        
        let duration: Int?
        if let durationString = dto.duration {
            duration = Int(durationString)
        } else {
            duration = nil
        }
        
        return SearchItem(
            id: id,
            title: dto.name,
            description: dto.description,
            imageURL: dto.avatarUrl,
            episodeCount: episodeCount,
            duration: duration
        )
    }
}
