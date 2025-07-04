//
//  TestDataFactory.swift
//  Thmanyah
//
//  Created by Amr Magdy on 04/07/2025.
//


import Foundation
@testable import Thmanyah

struct TestDataFactory {
    
    // MARK: - Domain Models
    static func createMockSection(
        name: String = "Test Section",
        order: Int = 1,
        hasContent: Bool = true,
        layoutType: SectionType = .square,
        contentType: ContentType = .podcast
    ) -> Section {
        let content: SectionContent = hasContent ? .podcasts([createMockPodcast()]) : .podcasts([])
        return Section(
            title: name,
            layoutType: .square,
            contentType: .podcast,
            content: .podcasts([createMockPodcast()])
        )
    }
    
    static func createMockPodcast(
        id: String = "1",
        title: String = "Test Podcast",
        episodeCount: Int = 10
    ) -> Podcast {
        return Podcast(
            id: id,
            title: title,
            description: "Test Description",
            imageURL: "url",
            episodeCount: episodeCount,
            totalDuration: 3600,
            language: "en"
        )
    }
    
    static func createMockEpisode(
        id: String = "1",
        title: String = "Test Episode",
        podcastTitle: String = "Test Podcast"
    ) -> Episode {
        return Episode(
            id: id,
            title: title,
            description: "Test Episode Description",
            imageURL: "url",
            duration: 1800, podcastTitle: podcastTitle,
            authorName: "Amr",
            episodeNumber: 1, seasonNumber: 1,
            releaseDate: Date(),
            audioURL: "url",
            episodeType: "type"
        )
    }
    
    static func createMockAudioBook(
            id: String = "1",
            title: String = "Test AudioBook",
            authorName: String = "amr"
        ) -> AudioBook {
            return AudioBook(
                id: id,
                title: title,
                author: authorName,
                description: "Test AudioBook Description",
                coverImageURL: "url",
                duration: 7200,
                language: "en",
                releaseDate: Date(),
                rating: 4.5,
                ratingCount: 100,
                narrator: "Amr Narrator",
                publisher: "Test Publisher",
                category: "Fiction"
            )
        }
    
    
    static func createMockPagination(
        hasNextPage: Bool = true,
        currentPage: Int = 1,
        totalPages: Int = 5
    ) -> Pagination {
        return Pagination(
            nextPageURL: hasNextPage ? "/home_sections?page=\(currentPage + 1)" : nil,
            totalPages: totalPages,
            currentPage: currentPage,
            itemsPerPage: 20
        )
    }
    
    static func createMockHomeSectionsResponse() -> HomeSectionsResponse {
        let sectionDTO = SectionDTO(
            name: "Top Podcasts",
            type: "square",
            contentType: "podcast",
            content: []
        )
        
        let paginationDTO = PaginationDTO(
            nextPage: "/home_sections?page=2",
            totalPages: 10,
            currentPage: 1,
            pageSize: 20
        )
        
        return HomeSectionsResponse(
            sections: [sectionDTO],
            pagination: paginationDTO
        )
    }
    
    static func createMockSearchResponse() -> SearchResponse {
        return SearchResponse(
            sections: [
                SearchSectionDTO(
                    name: "Test Results",
                    type: "square",
                    contentType: "podcast",
                    order: "1",
                    content: [
                        SearchContentItemDTO(
                            podcastId: "1",
                            name: "Test Podcast",
                            description: "Test Description",
                            avatarUrl: "https://example.com/avatar.jpg",
                            episodeCount: "10",
                            duration: "3600",
                            language: "en",
                            priority: "1",
                            popularityScore: "5",
                            score: "100"
                        )
                    ]
                )
            ]
        )
    }
}
