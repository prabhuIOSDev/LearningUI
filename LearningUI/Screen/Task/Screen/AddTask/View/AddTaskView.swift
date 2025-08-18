//
//  AddTaskView.swift
//  LearningUI
//
//  Created by Prabhu Devar on 17/08/25.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var viewModel : TaskViewModel
    @State private var taskToAdd:Task = Task(id: 0, name: "", description: "", isCompleted: false, finishedDate: Date())
    
    @Binding var showAddTask : Bool
    
    
    var body: some View {
        
        NavigationStack {
            List{
                Section(header: Text("Task Details").font(.headline)){
                    TextField("Task Name ", text: $taskToAdd.name)
                    TextField("Task Description ", text:$taskToAdd.description)
                    
                }
                
                Section("Task Date / time  "){
                    DatePicker("Task Date", selection: $taskToAdd.finishedDate)
                }
            }
            .navigationTitle("Add Task")
            .toolbar(){
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        showAddTask = false
                    }, label: {
                       Text("Cancel")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        print("Add Button Clicked")
                    }, label: {
                       Text("Add")
                    })
                }
            }
        }
    }
}

#Preview {
    AddTaskView(viewModel: TaskViewModel(), showAddTask: .constant(false))
}
