//
//  SearchRepositoryProtocol.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//


import Foundation

protocol SearchRepositoryProtocol {
    func searchContent(query: String) async throws -> [SearchSection]
}
