//
//  LandingScreen.swift
//  LearningUI
//
//  Created by Prabhu Devar on 04/08/25.
//

import SwiftUI

struct LandingScreen: View {
    @StateObject private var viewModel = OnboardingViewModel()
    var body: some View {
        ZStack{
            BackgroundView()
            VStack(spacing: 0) {
                OnboardingContainerView()
                    .environmentObject(viewModel)
                     }
        }
      
    }
}

#Preview {
    LandingScreen()
}

struct OnboardingContainerView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 0) {
                OnboardingPagesView()
             OnboardingControlsView()
            }
        }
    }
}


struct OnboardingControlsView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            PageIndicatorView()
            NavigationButtonsView()
            PageCounterView()
        }
        .padding(.bottom, 50)
    }
}


struct PageIndicatorView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<viewModel.totalPages, id: \.self) { index in
            
                 Circle()
                    .fill( index == viewModel.currentPage ? Color.yellow : Color.white.opacity(0.5))
                .frame(width: 8, height: 8)
                .scaleEffect(index == viewModel.currentPage ? 1.2 : 1.0)
                .animation(.easeInOut(duration: 0.3), value: viewModel.currentPage)
                .onTapGesture {
                    viewModel.goToPage(index)
                }
    
                
            }
        }
    }
}

struct NavigationButtonsView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        HStack {
            BackButtonView()
            Spacer()
            NextButtonView()
        }
        .padding(.horizontal, 30)
    }
}

struct BackButtonView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        Button(action: viewModel.goToPreviousPage) {
            Image(systemName: "chevron.left")
                .font(.title2)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(viewModel.isFirstPage ? Color.gray.opacity(0.5) : Color .yellow)
                .clipShape(Circle())
        }
        .disabled(viewModel.isFirstPage)
    }
}

struct NextButtonView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        Button(action: viewModel.goToNextPage) {
            Text(viewModel.nextButtonTitle)
                .font(.headline)
                .foregroundColor(.black)
                .frame(width: 120, height: 50)
                .background(Color.yellow)
                .cornerRadius(25)
        }
    }
}

struct PageCounterView: View {
    @EnvironmentObject var viewModel: OnboardingViewModel
    
    var body: some View {
        Text(viewModel.currentPageNumber)
            .font(.caption)
            .foregroundColor(.white.opacity(0.8))
    }
}
