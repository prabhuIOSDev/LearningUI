//
//  BasicLearning.swift
//  LearningUI
//
//  Created by Prabhu Devar on 21/08/25.
//

import SwiftUI

struct BasicLearning: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                Image(systemName: "house")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250,height: 250)
                    .foregroundStyle(.blue)
                Text("First Screen")
                    .font(.headline)
                    .fontWeight(.bold)
                
                Button{
                    path.append("second")
                } label:{
                    ContinueButton(string: "Continue", color: .blue)
                }
                
            }
            .navigationDestination(for: String.self) { value in
                            if value == "second" {
                                SecondScreen(path: $path)
                            }
                        }
            .navigationTitle("Home")
        }
            
    }
}

struct ContinueButton:View{
    let string:String
    let color:Color
    var body: some View{
        Text(string)
            .font(.subheadline)
            .fontWeight(.semibold)
            .frame(width: 200, height: 50)
            .background(color)
            .foregroundStyle(.white)
            .cornerRadius(10)
    }
}

#Preview {
    BasicLearning()
}
