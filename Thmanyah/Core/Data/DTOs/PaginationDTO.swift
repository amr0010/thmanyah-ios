//
//  PaginationDTO.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct PaginationDTO: Codable {
    let nextPage: String?
    let totalPages: Int?
    let currentPage: Int?
    let pageSize: Int?
    
    enum CodingKeys: String, CodingKey {
        case nextPage = "next_page"
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case pageSize = "page_size"
    }
}
