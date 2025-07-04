//
//  SectionMapper.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct SectionMapper {
    
    static func map(_ dto: SectionDTO) -> Section {
        let sectionType = dto.type.flatMap { SectionType(rawValue: $0) }
        let contentType = dto.contentType.flatMap { ContentType(rawValue: $0) }
        let content = mapContent(dto.content, contentType: contentType)
        
        return Section(
            title: dto.name,
            layoutType: sectionType,
            contentType: contentType,
//            order: dto.order,
            content: content
        )
    }
    
    private static func mapContent(_ contentItems: [ContentItemDTO]?, contentType: ContentType?) -> SectionContent? {
        guard let contentItems = contentItems, !contentItems.isEmpty else { return nil }
        
        switch contentType {
        case .podcast:
            let podcasts = contentItems.compactMap { PodcastMapper.map($0) }
            return podcasts.isEmpty ? nil : .podcasts(podcasts)
        case .episode:
            let episodes = contentItems.compactMap { EpisodeMapper.map($0) }
            return episodes.isEmpty ? nil : .episodes(episodes)
        case .audioBook:
            let audioBooks = contentItems.compactMap { AudioBookMapper.map($0) }
            return audioBooks.isEmpty ? nil : .audioBooks(audioBooks)
        case .audioArticle:
            let audioArticles = contentItems.compactMap { AudioArticleMapper.map($0) }
            return audioArticles.isEmpty ? nil : .audioArticles(audioArticles)
        case .none:
            return nil
        }
    }
    
    static func mapHomeSectionsResponse(_ response: HomeSectionsResponse) -> (sections: [Section], pagination: Pagination?) {
        let sections = response.sections?.compactMap { map($0) } ?? []
        let pagination = response.pagination.map { PaginationMapper.map($0) }
        return (sections, pagination)
    }
}
