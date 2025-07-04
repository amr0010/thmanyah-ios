//
//  AudioBook.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct AudioBook: Identifiable, Equatable {
    let id: String
    let title: String?
    let author: String?
    let description: String?
    let coverImageURL: String?
    let duration: Int?
    let language: String?
    let releaseDate: Date?
    let rating: Double?
    let ratingCount: Int?
    let narrator: String?
    let publisher: String?
    let category: String?
    
    var displayTitle: String {
        return title ?? "Unknown Audiobook"
    }
    
    var authorName: String {
        return author ?? "Unknown Author"
    }
    
    var durationText: String {
        guard let duration = duration else { return "" }
        let hours = duration / 3600
        let minutes = (duration % 3600) / 60
        
        if hours > 0 {
            return "\(hours)h \(minutes)m"
        } else {
            return "\(minutes)m"
        }
    }
    
    var ratingText: String {
        guard let rating = rating else { return "No rating" }
        return String(format: "%.1f", rating)
    }
 
    var formattedRating: String {
        return ratingText
    }
}
