//
//  SearchSectionView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import SwiftUI

struct SearchSectionView: View {
    
    let section: SearchSection
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            SearchSectionHeaderView(
                title: section.displayTitle,
                itemCount: section.itemsCount
            )
            
            SearchSectionContentView(section: section)
        }
    }
}
