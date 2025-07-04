//
//  SearchContentUseCaseProtocol.swift
//  Thmanyah
//
//  Created by Amr Magdy on 04/07/2025.
//


import Foundation

protocol SearchContentUseCaseProtocol {
    func execute(query: String) async throws -> [SearchSection]
}