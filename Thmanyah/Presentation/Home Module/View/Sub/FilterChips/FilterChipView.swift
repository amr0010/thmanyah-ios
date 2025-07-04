//
//  FilterChipView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import SwiftUI

struct FilterChipView: View {
    
    let filter: ContentFilter
    let isSelected: Bool
    let onTap: () -> Void
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: DesignSystem.Spacing.xs) {
                if let icon = filter.icon {
                    Image(systemName: icon)
                        .font(.system(size: 14, weight: .medium))
                }
                
                Text(filter.displayName)
                    .font(DesignSystem.Typography.arabicFont(
                        size: DesignSystem.Typography.subheadline,
                        weight: .medium
                    ))
            }
            .padding(.horizontal, DesignSystem.Spacing.lg)
            .padding(.vertical, DesignSystem.Spacing.sm)
            .background(
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xl)
                    .fill(isSelected ? filter.accentColor : DesignSystem.Colors.surfaceBackground)
            )
            .foregroundColor(
                isSelected ? .white : DesignSystem.Colors.primaryText
            )
            .overlay(
                RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.xl)
                    .stroke(
                        isSelected ? Color.clear : DesignSystem.Colors.tertiaryText.opacity(0.3),
                        lineWidth: 1
                    )
            )
        }
        .buttonStyle(PlainButtonStyle())
    }
}
