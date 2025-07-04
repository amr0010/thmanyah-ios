//
//  SectionDTO.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct SectionDTO: Codable {
    let name: String?
    let type: String?
    let contentType: String?
//    let order: Int?
    let content: [ContentItemDTO]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case type
        case contentType = "content_type"
//        case order
        case content
    }
}


