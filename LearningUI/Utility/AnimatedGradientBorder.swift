//
//  AnimatedGradientBorder.swift
//  LearningUI
//
//  Created by Prabhu Devar on 03/09/25.
//

import SwiftUI

struct AnimatedGradientBorder: View {
    var cornerRadius: CGFloat
    var lineWidth: CGFloat
    @State private var animate = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: cornerRadius)
            .strokeBorder(
                AngularGradient(
                    gradient: Gradient(colors: [.red, .orange, .yellow, .green, .blue, .purple, .red]),
                    center: .center,
                    angle: .degrees(animate ? 360 : 0)
                ),
                lineWidth: lineWidth
            )
            .onAppear {
                withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                    animate.toggle()
                }
            }
    }
}

#Preview {
    AnimatedGradientBorder(cornerRadius: 12, lineWidth: 4)
}
