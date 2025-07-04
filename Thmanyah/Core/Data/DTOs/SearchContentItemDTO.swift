//
//  SearchContentItemDTO.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//


struct SearchContentItemDTO: Codable {
    let podcastId: String?
    let name: String?
    let description: String?
    let avatarUrl: String?
    let episodeCount: String?
    let duration: String?
    let language: String?
    let priority: String?
    let popularityScore: String?
    let score: String?
    
    enum CodingKeys: String, CodingKey {
        case podcastId = "podcast_id"
        case name
        case description
        case avatarUrl = "avatar_url"
        case episodeCount = "episode_count"
        case duration
        case language
        case priority
        case popularityScore = "popularityScore"
        case score
    }
}
