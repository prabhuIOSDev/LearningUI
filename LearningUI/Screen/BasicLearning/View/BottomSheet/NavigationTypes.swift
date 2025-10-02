//
//  NavigationTypes.swift
//  LearningUI
//
//  Created by Prabhu Devar on 29/09/25.
//

import SwiftUI

struct NavigationTypes: View {
    
    @Namespace private var animation
    @State var showMenu: Bool = false
    @State var showShare: Bool = false
    var body: some View {
        NavigationStack{
            if #available(iOS 26.0, *) {
                ScrollView{
                    LazyVStack(alignment:.leading){
                        ForEach(0..<5){
                            Text("index :\($0)")
                        }
                    }
                    .padding()
                }
                .navigationTitle("Welcome")
                .navigationSubtitle("swift learning")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Home",systemImage: "person.circle.fill"){
                            print("account")
//                            showMenu.toggle()
                            
                        }
                    }
                    ToolbarItem(placement: .topBarTrailing){
                        Button("Home",systemImage: "microphone"){
                            print("mic")
                            showMenu.toggle()
                        }
                    
                    }
                    .matchedTransitionSource(id: "mic", in: animation)
                    
                    
                    // bottom tool bar
                   
                
                    
                    
                
                    ToolbarItem(placement: .bottomBar) {
                        Button("Settings",systemImage: "square.and.arrow.up"){
                            showShare.toggle()
                        }
                    }
                    .matchedTransitionSource(id: "share", in: animation)
                    ToolbarItem(placement: .bottomBar) {
                        Button("Settings",systemImage: "network"){
                            print("settings")
                        }
                    }
                    ToolbarSpacer(.flexible, placement: .bottomBar)
                    ToolbarItem(placement: .bottomBar) {
                        Button("Settings",systemImage: "airplane.up.forward"){
                            print("settings")
                        }
                    }
                    .sharedBackgroundVisibility(.hidden)
                }
            
               
                .sheet(isPresented: $showMenu) {
                    BottomSheetView()
                        .navigationTransition(.zoom(sourceID: "mic", in: animation))
                }
                .sheet(isPresented: $showShare) {
                    Text("Hello, World!")
                        .navigationTransition(.zoom(sourceID: "share", in: animation))
                        .presentationDetents([.height(100)])
                }
                
                
            } else {
                // Fallback on earlier versions
            }
            
                
        }
      
     
    }
}

#Preview {
    NavigationTypes()
}
