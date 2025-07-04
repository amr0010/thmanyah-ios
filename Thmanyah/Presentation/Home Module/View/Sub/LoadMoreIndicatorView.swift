//
//  LoadMoreIndicatorView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 04/07/2025.
//

import SwiftUI

struct LoadMoreIndicatorView: View {
    
    let isLoading: Bool
    
    var body: some View {
        HStack {
            Spacer()
            
            if isLoading {
                HStack(spacing: DesignSystem.Spacing.md) {
                    ProgressView()
                        .scaleEffect(0.8)
                        .progressViewStyle(CircularProgressViewStyle(tint: DesignSystem.Colors.primary))
                    
                    Text("Loading more...")
                        .font(DesignSystem.Typography.arabicFont(
                            size: DesignSystem.Typography.caption1,
                            weight: .medium
                        ))
                        .foregroundColor(DesignSystem.Colors.secondaryText)
                }
                .padding(.vertical, DesignSystem.Spacing.lg)
            }
            
            Spacer()
        }
    }
}
