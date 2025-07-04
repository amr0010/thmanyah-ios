//
//  PlayButtonView.swift
//  Thmanyah
//
//  Created by Amr Magdy on 02/07/2025.
//

import SwiftUI

struct PlayButtonView: View {
    
    let size: CGFloat
    let action: () -> Void
    @State private var isPressed = false
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "play.fill")
                .font(.system(size: size * 0.4, weight: .medium))
                .foregroundColor(.white)
                .frame(width: size, height: size)
                .background(
                    Circle()
                        .fill(DesignSystem.Colors.episodeColor)
                        .shadow(
                            color: DesignSystem.Colors.episodeColor.opacity(0.3),
                            radius: 4,
                            x: 0,
                            y: 2
                        )
                )
        }
        .scaleEffect(isPressed ? 0.9 : 1.0)
        .onLongPressGesture(minimumDuration: 0) { pressing in
            isPressed = pressing
        } perform: {}
    }
}
