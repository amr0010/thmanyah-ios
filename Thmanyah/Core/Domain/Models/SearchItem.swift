//
//  SearchItem.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import Foundation

struct SearchItem: Identifiable, Equatable {
    let id: String
    let title: String?
    let description: String?
    let imageURL: String?
    let episodeCount: Int?
    let duration: Int?
    
    var displayTitle: String {
        return title ?? "Unknown"
    }
    
    var durationText: String {
        guard let duration = duration else { return "Unknown" }
        let hours = duration / 3600
        let minutes = (duration % 3600) / 60
        
        if hours > 0 {
            return "\(hours)h \(minutes)m"
        } else {
            return "\(minutes)m"
        }
    }
    
    var episodeCountText: String {
        guard let count = episodeCount else { return "" }
        return "\(count) episodes"
    }
    
    var cleanDescription: String {
        guard let description = description else { return "" }
        return description
            .replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
            .trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
