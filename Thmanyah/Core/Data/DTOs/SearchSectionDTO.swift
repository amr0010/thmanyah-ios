//
//  SearchSectionDTO.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import Foundation

struct SearchSectionDTO: Codable {
    let name: String?
    let type: String?
    let contentType: String?
    let order: String?
    let content: [SearchContentItemDTO]
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case contentType = "content_type"
        case order
        case content
    }
}
