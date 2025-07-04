//
//  Episode.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct Episode: Identifiable, Equatable {
    let id: String
    let title: String?
    let description: String?
    let imageURL: String?
    let duration: Int?
    let podcastTitle: String?
    let authorName: String?
    let episodeNumber: Int?
    let seasonNumber: Int?
    let releaseDate: Date?
    let audioURL: String?
    let episodeType: String?
    
    var displayTitle: String {
        return title ?? "Unknown Episode"
    }
    
    var shortDescription: String {
        guard let description = description else { return "No description available" }
        let cleanText = description.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
        return String(cleanText.prefix(120)) + (cleanText.count > 120 ? "..." : "")
    }
    
    var durationText: String {
        guard let duration = duration else { return "" }
        let minutes = duration / 60
        let seconds = duration % 60
        return String(format: "%d:%02d", minutes, seconds)
    }
    
    var releaseDateText: String {
        guard let releaseDate = releaseDate else { return "" }
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: releaseDate)
    }
    
    var episodeInfo: String {
        var info: [String] = []
        
        if let podcastTitle = podcastTitle {
            info.append(podcastTitle)
        }
        
        if let episodeNumber = episodeNumber {
            info.append("Episode \(episodeNumber)")
        }
        
        return info.joined(separator: " • ")
    }
}
