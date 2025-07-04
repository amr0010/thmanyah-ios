//
//  SearchSectionContentView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import SwiftUI

struct SearchSectionContentView: View {
    
    let section: SearchSection
    
    private let columns = [
        GridItem(.flexible(), spacing: DesignSystem.Spacing.cardSpacing),
        GridItem(.flexible(), spacing: DesignSystem.Spacing.cardSpacing)
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: DesignSystem.Spacing.cardSpacing) {
            ForEach(section.items.prefix(4), id: \.id) { item in
                SearchItemCardView(item: item)
            }
        }
    }
}
