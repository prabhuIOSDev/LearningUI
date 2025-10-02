//
//  BottomSheetView.swift
//  LearningUI
//
//  Created by Prabhu Devar on 29/09/25.
//

import SwiftUI

struct BottomSheetView: View {
    
    @State private var isExpanded: Bool = false
    
    @Namespace private var namespace
    let symbolSet: [String] = ["cloud.bolt.rain.fill", "sun.rain.fill", "moon.stars.fill", "moon.fill"]
    var body: some View {
    
        VStack(spacing:20){
           
            
            if #available(iOS 26.0, *) {
                Text("Hello, World!")
                    .font(Font.largeTitle)
                    .padding()
                    .glassEffect()
                
                Text("Welcome to my new channe!")
                    .font(Font.title2)
                    .padding()
                    .glassEffect(.regular.tint(.blue).interactive(), in: .rect(cornerRadius: 10))
                    .onTapGesture {
                        print("click")
                    }

                
                GlassEffectContainer(spacing:30){
                    HStack(spacing:30){
                        Image(systemName: "scribble.variable")
                                   .frame(width: 80.0, height: 80.0)
                                   .font(.system(size: 36))
                                   .glassEffect()
                        
                        Image(systemName: "eraser.fill")
                                    .frame(width: 80.0, height: 80.0)
                                    .font(.system(size: 36))
                                    .glassEffect()
                        
                                    .offset(x: -30,y: 0)
                    }
                }
                
                GlassEffectContainer(spacing: 20.0) {
                    HStack(spacing: 20.0) {
                        ForEach(symbolSet.indices, id: \.self) { item in
                            Image(systemName: symbolSet[item])
                                .frame(width: 80.0, height: 80.0)
                                .font(.system(size: 36))
                                .foregroundStyle(.blue)
                                .glassEffect()
                                .glassEffectUnion(id: item < 2 ? "1" : "2", namespace: namespace)
                            
                        }
                    }
                }
                
                
                GlassEffectContainer(spacing: 20) {
                      VStack(spacing: 20) {
                          Image(systemName: "scribble.variable")
                              .frame(width: 80.0, height: 80.0)
                              .font(.system(size: 36))
                              .glassEffect()
                              .glassEffectID("pencil", in: namespace)


                          if isExpanded {
                              Image(systemName: "eraser.fill")
                                  .frame(width: 80.0, height: 80.0)
                                  .font(.system(size: 36))
                                  .glassEffect()
                                  .glassEffectID("eraser", in: namespace)
                              Image(systemName: "eraser.fill")
                                  .frame(width: 80.0, height: 80.0)
                                  .font(.system(size: 36))
                                  .glassEffect()
                                  .glassEffectID("eraser", in: namespace)
                              Image(systemName: "scribble.variable")
                                  .frame(width: 80.0, height: 80.0)
                                  .font(.system(size: 36))
                                  .glassEffect()
                                  .glassEffectID("pencil", in: namespace)
                          }
                      }
                  }
                
                
                Button("Tapped"){
                    withAnimation {
                               isExpanded.toggle()
                           }
                }
                .buttonStyle(.glass)

             
                
            } else {
                // Fallback on earlier versions
            }
                
        }
        .padding()
    }
}

#Preview {
    BottomSheetView()
}
