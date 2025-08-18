//
//  TodoApp.swift
//  LearningUI
//
//  Created by Prabhu Devar on 08/08/25.
//

import SwiftUI

struct TodoApp: View {
    
    @State private var selectedItem = 0
    var body: some View {
        List(0 ..< 10) { item in
            HStack() {
                ZStack {
                    Circle()
                        .frame(width: 30,height: 30)
                        .foregroundStyle(.gray.opacity(0.1))
                    Image(systemName: selectedItem == item ? "checkmark.circle" : "record.circle")
                        .foregroundStyle( selectedItem == item ? .green :.gray)
                        .font(.system(size: 20))
                }.onTapGesture {
                    print(item)
                    withAnimation(.spring(response: 0.25, dampingFraction: 0.9)) {
                        selectedItem = item
                    }
                }
                
                VStack(alignment: .leading, spacing: 10){
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text("This is a new project")
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .fontWeight(.semibold)
                }
                .padding(.leading)
                Spacer()
                Image(systemName: "line.horizontal.3")
                    .foregroundStyle(.green)
            }
        }
    }
}

#Preview {
    TodoApp()
}
