//
//  RatingStarsView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct RatingStarsView: View {
    
    let rating: Double
    let maxRating: Int = 5
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(1...maxRating, id: \.self) { index in
                Image(systemName: starIcon(for: index))
                    .font(.system(size: DesignSystem.Typography.caption1, weight: .medium))
                    .foregroundColor(DesignSystem.Colors.warningColor)
            }
        }
    }
    
    private func starIcon(for index: Int) -> String {
        if Double(index) <= rating {
            return "star.fill"
        } else if Double(index) - 0.5 <= rating {
            return "star.leadinghalf.filled"
        } else {
            return "star"
        }
    }
}
