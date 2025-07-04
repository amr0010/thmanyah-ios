//
//  HomeSectionsResponse.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import Foundation

struct HomeSectionsResponse: Codable {
    let sections: [SectionDTO]?
    let pagination: PaginationDTO?
}
