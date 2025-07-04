//
//  ContentItemDTO.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct ContentItemDTO: Codable {
    let podcastId: String?
    let name: String?
    let description: String?
    let avatarUrl: String?
    let episodeCount: Int?
    let duration: Int?
    let language: String?
    
    let episodeId: String?
    let seasonNumber: Int?
    let episodeType: String?
    let podcastName: String?
    let authorName: String?
    let number: Int?
    let separatedAudioUrl: String?
    let audioUrl: String?
    let releaseDate: String?
    let podcastPopularityScore: Int?
    let podcastPriority: Int?
    
    let audiobookId: String?
    let rating: Double?
    let ratingCount: Int?
    let publisher: String?
    let category: String?
    let narrator: String?
    
    let articleId: String?
    let source: String?
    let originalArticleUrl: String?
    let keywords: [String]?
    let viewCount: Int?
    let estimatedReadingTime: Int?
    let tags: [String]?
    
    enum CodingKeys: String, CodingKey {
        case podcastId = "podcast_id"
        case name
        case description
        case avatarUrl = "avatar_url"
        case episodeCount = "episode_count"
        case duration
        case language
        case episodeId = "episode_id"
        case seasonNumber = "season_number"
        case episodeType = "episode_type"
        case podcastName = "podcast_name"
        case authorName = "author_name"
        case number
        case separatedAudioUrl = "separated_audio_url"
        case audioUrl = "audio_url"
        case releaseDate = "release_date"
        case podcastPopularityScore
        case podcastPriority
        case audiobookId = "audiobook_id"
        case rating
        case ratingCount = "rating_count"
        case publisher
        case category
        case narrator
        case articleId = "article_id"
        case source
        case originalArticleUrl = "original_article_url"
        case keywords
        case viewCount = "view_count"
        case estimatedReadingTime = "estimated_reading_time"
        case tags
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        podcastId = try container.decodeIfPresent(String.self, forKey: .podcastId)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        avatarUrl = try container.decodeIfPresent(String.self, forKey: .avatarUrl)
        language = try container.decodeIfPresent(String.self, forKey: .language)
        
        if let episodeCountInt = try? container.decodeIfPresent(Int.self, forKey: .episodeCount) {
            episodeCount = episodeCountInt
        } else if let episodeCountString = try? container.decodeIfPresent(String.self, forKey: .episodeCount) {
            episodeCount = Int(episodeCountString)
        } else {
            episodeCount = nil
        }
        
        if let durationInt = try? container.decodeIfPresent(Int.self, forKey: .duration) {
            duration = durationInt
        } else if let durationString = try? container.decodeIfPresent(String.self, forKey: .duration) {
            duration = Int(durationString)
        } else {
            duration = nil
        }
        
        
        
        
        
        episodeId = try container.decodeIfPresent(String.self, forKey: .episodeId)
        seasonNumber = try container.decodeIfPresent(Int.self, forKey: .seasonNumber)
        episodeType = try container.decodeIfPresent(String.self, forKey: .episodeType)
        podcastName = try container.decodeIfPresent(String.self, forKey: .podcastName)
        authorName = try container.decodeIfPresent(String.self, forKey: .authorName)
        number = try container.decodeIfPresent(Int.self, forKey: .number)
        separatedAudioUrl = try container.decodeIfPresent(String.self, forKey: .separatedAudioUrl)
        audioUrl = try container.decodeIfPresent(String.self, forKey: .audioUrl)
        releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
        podcastPopularityScore = try container.decodeIfPresent(Int.self, forKey: .podcastPopularityScore)
        podcastPriority = try container.decodeIfPresent(Int.self, forKey: .podcastPriority)
        
        audiobookId = try container.decodeIfPresent(String.self, forKey: .audiobookId)
        rating = try container.decodeIfPresent(Double.self, forKey: .rating)
        ratingCount = try container.decodeIfPresent(Int.self, forKey: .ratingCount)
        publisher = try container.decodeIfPresent(String.self, forKey: .publisher)
        category = try container.decodeIfPresent(String.self, forKey: .category)
        narrator = try container.decodeIfPresent(String.self, forKey: .narrator)
        
        articleId = try container.decodeIfPresent(String.self, forKey: .articleId)
        source = try container.decodeIfPresent(String.self, forKey: .source)
        originalArticleUrl = try container.decodeIfPresent(String.self, forKey: .originalArticleUrl)
        keywords = try container.decodeIfPresent([String].self, forKey: .keywords)
        viewCount = try container.decodeIfPresent(Int.self, forKey: .viewCount)
        estimatedReadingTime = try container.decodeIfPresent(Int.self, forKey: .estimatedReadingTime)
        tags = try container.decodeIfPresent([String].self, forKey: .tags)
    }
    

}
