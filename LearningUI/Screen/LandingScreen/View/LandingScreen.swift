//
//  LandingScreen.swift
//  LearningUI
//
//  Created by Prabhu Devar on 04/08/25.
//

import SwiftUI

struct LandingScreen: View {
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.white, .gray.opacity(0.8)]), startPoint: .top, endPoint: .bottomLeading)
            
            VStack{
               Image(systemName: "figure.stand.line.dotted.figure.stand")
                    .resizable()
                    .frame(width: 200,height: 200)
                    .foregroundStyle(.tint)
                
                
                Text("Explore the world \nof SwiftUI")
                    .fontWeight(.semibold)
                    .font(.system(size: 32, weight: .bold, design: .default))
            }
        }
        .ignoresSafeArea(.all)
    }
}

#Preview {
    LandingScreen()
}
