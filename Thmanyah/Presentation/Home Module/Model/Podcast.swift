//
//  Podcast.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct Podcast: Identifiable, Equatable {
    let id: String
    let title: String?
    let description: String?
    let imageURL: String?
    let episodeCount: Int?
    let totalDuration: Int?
    let language: String?
//    let priority: Int?
//    let popularityScore: Int?
    
    var displayTitle: String {
        return title ?? "Unknown Podcast"
    }
    
    var shortDescription: String {
        guard let description = description else { return "No description available" }
        let cleanText = description.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
        return String(cleanText.prefix(100)) + (cleanText.count > 100 ? "..." : "")
    }
    
    var episodeCountText: String {
        guard let count = episodeCount else { return "" }
        return "\(count) episodes"
    }
    
    var durationText: String {
        guard let duration = totalDuration else { return "" }
        let hours = duration / 3600
        let minutes = (duration % 3600) / 60
        
        if hours > 0 {
            return "\(hours)h \(minutes)m"
        } else {
            return "\(minutes)m"
        }
    }
}
