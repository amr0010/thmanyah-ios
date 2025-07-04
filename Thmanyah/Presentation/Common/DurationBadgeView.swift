//
//  DurationBadgeView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct DurationBadgeView: View {
    
    let duration: String
    let backgroundColor: Color
    
    init(duration: String, backgroundColor: Color = Color.black.opacity(0.7)) {
        self.duration = duration
        self.backgroundColor = backgroundColor
    }
    
    var body: some View {
        Text(duration)
            .font(DesignSystem.Typography.arabicFont(
                size: DesignSystem.Typography.caption2,
                weight: .medium
            ))
            .foregroundColor(.white)
            .padding(.horizontal, DesignSystem.Spacing.xs)
            .padding(.vertical, 2)
            .background(backgroundColor)
            .cornerRadius(DesignSystem.CornerRadius.xs)
    }
}
