//
//  SectionView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct SectionView: View {
    
    let section: Section
    
    var body: some View {
        VStack(alignment: .leading, spacing: DesignSystem.Spacing.md) {
            SectionHeaderView(
                title: section.displayTitle,
                contentType: section.contentType
            )
            
            switch section.layoutType {
            case .square:
                SquareGridView(section: section)
            case .twoLinesGrid:
                TwoLinesGridView(section: section)
            case .bigSquare:
                BigSquareView(section: section)
            case .queue:
                QueueView(section: section)
            case .none:
                EmptyView()
            }
        }
    }
}

struct SectionHeaderView: View {
    
    let title: String
    let contentType: ContentType?
    
    var body: some View {
        HStack(alignment: .center, spacing: DesignSystem.Spacing.md) {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(title)
                    .sectionTitleStyle()
                
                if let contentType = contentType {
                    ContentTypeBadge(contentType: contentType)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, DesignSystem.Spacing.xs)
    }
}
