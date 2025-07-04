//
//  LoadingView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        VStack(spacing: DesignSystem.Spacing.lg) {
            ProgressView()
                .scaleEffect(1.2)
                .progressViewStyle(CircularProgressViewStyle(tint: DesignSystem.Colors.primary))
            
            Text("جاري التحميل...")
                .font(DesignSystem.Typography.arabicFont(
                    size: DesignSystem.Typography.subheadline,
                    weight: .medium
                ))
                .foregroundColor(DesignSystem.Colors.secondaryText)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DesignSystem.Colors.background)
    }
}
