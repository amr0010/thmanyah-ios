//
//  SearchBarView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 03/07/2025.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var searchText: String
    let isLoading: Bool
    let onClear: () -> Void
    
    var body: some View {
        HStack(spacing: DesignSystem.Spacing.md) {
            Image(systemName: "magnifyingglass")
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(DesignSystem.Colors.tertiaryText)
            
            TextField("Search podcasts, episodes, audiobooks...", text: $searchText)
                .font(DesignSystem.Typography.arabicFont(
                    size: DesignSystem.Typography.body,
                    weight: .regular
                ))
                .foregroundColor(DesignSystem.Colors.primaryText)
                .textFieldStyle(PlainTextFieldStyle())
                .submitLabel(.search)
            
            if isLoading {
                ProgressView()
                    .scaleEffect(0.8)
                    .progressViewStyle(CircularProgressViewStyle(tint: DesignSystem.Colors.primary))
            } else if !searchText.isEmpty {
                Button(action: onClear) {
                    Image(systemName: "xmark.circle.fill")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(DesignSystem.Colors.tertiaryText)
                }
                .transition(.scale.combined(with: .opacity))
            }
        }
        .padding(.horizontal, DesignSystem.Spacing.lg)
        .padding(.vertical, DesignSystem.Spacing.md)
        .background(DesignSystem.Colors.surfaceBackground)
        .cornerRadius(DesignSystem.CornerRadius.lg)
        .overlay(
            RoundedRectangle(cornerRadius: DesignSystem.CornerRadius.lg)
                .stroke(DesignSystem.Colors.tertiaryText.opacity(0.2), lineWidth: 1)
        )
    }
}
