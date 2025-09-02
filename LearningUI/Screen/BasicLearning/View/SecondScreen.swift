//
//  SecondScreen.swift
//  LearningUI
//
//  Created by Prabhu Devar on 22/08/25.
//

import SwiftUI

struct SecondScreen: View {
    @Binding var path: NavigationPath
    var body: some View {
        VStack{
            Image(systemName: "bell")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
            Text("Second screen")
                .font(.title)
                .fontWeight(.semibold)
            Button{
                path.removeLast()
            } label: {
                ContinueButton(string: "Go to Home", color: .accentColor)
            }
            
            
            
            
        }
        
        .navigationTitle("Notification")
    }
}

#Preview {
    SecondScreen(path: .constant(NavigationPath()))
}
