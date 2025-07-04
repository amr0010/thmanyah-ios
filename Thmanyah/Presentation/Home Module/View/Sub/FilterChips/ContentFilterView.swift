//
//  ContentFilterView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//


import SwiftUI

struct ContentFilterView: View {
    
    @Binding var selectedFilter: ContentFilter
    let filters: [ContentFilter]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: DesignSystem.Spacing.md) {
                ForEach(filters, id: \.id) { filter in
                    FilterChipView(
                        filter: filter,
                        isSelected: selectedFilter.id == filter.id
                    ) {
                        selectedFilter = filter
                    }
                }
            }
            .padding(.horizontal, DesignSystem.Spacing.screenPadding)
        }
        .padding(.vertical, DesignSystem.Spacing.sm)
    }
}

