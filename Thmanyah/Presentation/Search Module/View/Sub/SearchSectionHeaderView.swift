//
//  SearchSectionHeaderView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import SwiftUI

struct SearchSectionHeaderView: View {
    
    let title: String
    let itemCount: Int
    
    var body: some View {
        HStack(alignment: .center, spacing: DesignSystem.Spacing.md) {
            VStack(alignment: .leading, spacing: DesignSystem.Spacing.xs) {
                Text(title)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.title3,
                        weight: .bold
                    ))
                    .foregroundColor(DesignSystem.Colors.primaryText)
                
                Text("\(itemCount) results")
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.caption1,
                        weight: .medium
                    ))
                    .foregroundColor(DesignSystem.Colors.secondaryText)
            }
            
            Spacer()
            
        }
        .padding(.horizontal, DesignSystem.Spacing.xs)
    }
}
