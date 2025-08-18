//
//  HomeView.swift
//  LearningUI
//
//  Created by Prabhu Devar on 17/08/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var taskviewModel:TaskViewModel = TaskViewModel()
    
    @State private var pickerFilter = ["Active","Completed"]
    @State private var defaultPickerSelection = "Active"
    
    var body: some View {
        
        NavigationStack{
            Picker("Picker Filter ",selection: $defaultPickerSelection
            ){
                ForEach(pickerFilter,id: \.self){
                    Text($0)
                    
                    
                }
            }.pickerStyle(.segmented)
                .onChange(of: defaultPickerSelection, initial: false) { _,_  in
                    taskviewModel.getTask(isActive: defaultPickerSelection == "Active")
                }
            
            List(taskviewModel.tasks,id:\.id){ task in
                VStack(alignment:.leading,spacing: 8){
                    Text(task.name)
                        .font(.headline)
                        .fontWeight(.bold)
                    HStack{
                        Text(task.description)
                            .font(.subheadline)
                            .fontWeight(.thin)
                        Spacer()
                        Text(task.finishedDate.toString())
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle(.secondary)
                    }
                }
                
            }
            .onAppear{
                taskviewModel.getTask(isActive: true)
            }
            .navigationTitle("Your Task")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        print("Add")
                    } label:{
                        Image(systemName: "plus")
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    HomeView()
}
