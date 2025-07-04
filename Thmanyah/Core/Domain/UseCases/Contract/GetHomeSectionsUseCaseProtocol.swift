//
//  GetHomeSectionsUseCaseProtocol.swift
//  Thmanyah
//
//  Created by Amr Magdy on 04/07/2025.
//

import Foundation

protocol GetHomeSectionsUseCaseProtocol {
    func execute(page: Int?) async throws -> (sections: [Section], pagination: Pagination?)
}
