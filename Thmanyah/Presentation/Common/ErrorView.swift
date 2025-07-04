//
//  ErrorView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct ErrorView: View {
    
    let message: String
    let retryAction: () -> Void
    
    var body: some View {
        VStack(spacing: DesignSystem.Spacing.xl) {
            Image(systemName: "exclamationmark.triangle.fill")
                .font(.system(size: 50))
                .foregroundColor(DesignSystem.Colors.errorColor)
            
            Text("حدث خطأ")
                .font(DesignSystem.Typography.arabicFont(
                    size: DesignSystem.Typography.title2,
                    weight: .bold
                ))
                .foregroundColor(DesignSystem.Colors.primaryText)
            
            Text(message)
                .font(DesignSystem.Typography.arabicFont(
                    size: DesignSystem.Typography.body,
                    weight: .regular
                ))
                .foregroundColor(DesignSystem.Colors.secondaryText)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(DesignSystem.Colors.background)
    }
}
