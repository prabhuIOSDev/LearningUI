//
//  OnboardingViewModel.swift
//  LearningUI
//
//  Created by Prabhu Devar on 05/08/25.
//

import SwiftUI

class OnboardingViewModel : ObservableObject{
  @Published  var currentPage:Int = 0
   @Published var showMainView:Bool = false
    
    // create a array for model class
    let pages:[OnboardingPage] = [
        OnboardingPage(title: "Explore the World\nwith Us", discription: "Explore the world's most beautiful places, handpicked just for you.", image: "images1", backgroundcolor: Color.mint.opacity(0.3)),
        OnboardingPage(title: "Discover Hidden Gems\nAround the World", discription: "Discover hidden gems and unique experiences around the world.", image: "images2", backgroundcolor: Color.mint.opacity(0.3)),
        OnboardingPage(title: "Plan Your Trip\nToday", discription: "Plan your trip today and start exploring.", image: "images4", backgroundcolor: Color.mint.opacity(0.3))
    ]
    
    
    var totalPages: Int {
          pages.count
      }
      
      var isFirstPage: Bool {
          currentPage == 0
      }
      
      var isLastPage: Bool {
          currentPage == totalPages - 1
      }
      
      var currentPageNumber: String {
          "\(currentPage + 1)/\(totalPages)"
      }
      
      var nextButtonTitle: String {
          isLastPage ? "Get Started" : "Next"
      }
      
      func goToNextPage() {
          if isLastPage {
              completeOnboarding()
          } else {
              withAnimation(.easeInOut(duration: 0.5)) {
                  currentPage += 1
              }
          }
      }
      
      func goToPreviousPage() {
          guard !isFirstPage else { return }
          withAnimation(.easeInOut(duration: 0.5)) {
              currentPage -= 1
          }
      }
      
      func goToPage(_ page: Int) {
          guard page >= 0 && page < totalPages else { return }
          withAnimation(.easeInOut(duration: 0.5)) {
              currentPage = page
          }
      }
      
      private func completeOnboarding() {
          withAnimation(.easeInOut(duration: 0.5)) {
              showMainView = true
          }
          // Here you can also save onboarding completion to UserDefaults
          UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
      }
    
}
