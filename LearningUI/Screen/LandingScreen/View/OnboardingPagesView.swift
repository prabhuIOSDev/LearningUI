//
//  OnboardingPagesView.swift
//  LearningUI
//
//  Created by Prabhu Devar on 06/08/25.
//

import SwiftUI

struct OnboardingPagesView: View {
    
    @EnvironmentObject var viewModel: OnboardingViewModel
    var body: some View {
        
        TabView(selection: $viewModel.currentPage) {
            ForEach(Array(viewModel.pages.enumerated()), id: \.element.id) { index, page in
                OnboardingPageView(page: page)
                                  .tag(index)
                
               
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .animation(.easeInOut(duration: 0.5), value: viewModel.currentPage)
    }
}


#Preview {
   OnboardingPagesView()
        .environmentObject(OnboardingViewModel())
    
}



struct OnboardingPageView: View {
    let page: OnboardingPage
    
    var body: some View {
        VStack(spacing: 40) {
            Spacer()
            
            OnboardingIconView(
                imageName: page.image,
                backgroundColor: page.backgroundcolor
            )
            .frame(width: 390, height: 390)
            OnboardingTextContentView(
                title: page.title,
                description: page.discription
            )
            
            Spacer()
        }
        .padding()
    }
}

struct OnboardingIconView: View {
    let imageName: String
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            Image(imageName)
                .font(.system(size: 80))
            
        }
        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}


struct OnboardingTextContentView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Text(description)
                .font(.body)
                .foregroundColor(.white.opacity(0.9))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .lineLimit(nil)
        }
    }
}


