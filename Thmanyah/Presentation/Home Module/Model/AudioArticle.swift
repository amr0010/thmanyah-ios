//
//  AudioArticle.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct AudioArticle: Identifiable, Equatable {
    let id: String
    let title: String?
    let author: String?
    let description: String?
    let imageURL: String?
    let duration: Int?
    let publishedDate: Date?
    let source: String?
    let category: String?
    let audioURL: String?
    let originalArticleURL: String?
    let readingTime: Int?
    let viewCount: Int?
    let tags: [String]?
    
    var displayTitle: String {
        return title ?? "Unknown Article"
    }
    
    var authorName: String {
        return author ?? "Unknown Author"
    }
     
    var durationText: String {
        guard let duration = duration else { return "" }
        let minutes = duration / 60
        let seconds = duration % 60
        return String(format: "%d:%02d", minutes, seconds)
    }

}
