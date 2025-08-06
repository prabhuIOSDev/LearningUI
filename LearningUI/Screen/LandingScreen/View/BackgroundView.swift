//
//  BackgroundView.swift
//  LearningUI
//
//  Created by Prabhu Devar on 05/08/25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.6),
                        Color.cyan.opacity(0.4)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
        .ignoresSafeArea()
    }
}

#Preview {
    BackgroundView()
}
