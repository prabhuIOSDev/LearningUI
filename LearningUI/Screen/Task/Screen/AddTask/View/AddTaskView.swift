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
    @Binding var refreshTaskList : Bool
    @State private var showAlert = false
    
    
    
    
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
                    Button{
                        if !taskToAdd.name.isEmpty || !taskToAdd.description.isEmpty{
                            showAlert.toggle()
                        }else{
                            showAddTask.toggle()
                        }
                     
//
                    }label: {
                       Text("Cancel")
                    }
                    .alert("save task", isPresented: $showAlert) {
                        Button{
                            showAddTask.toggle()
                        } label: {
                            Text("Cancel")
                        }
                        Button{
                           addaTask()
                        } label: {
                            Text("Save")
                        }
                    } message: {
                        Text("Would you like to save task before leaving?")
                    }

                   
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        addaTask()
                    }, label: {
                       Text("Add")
                    })
                    .disabled(taskToAdd.name.isEmpty || taskToAdd.description.isEmpty)
                }
            }
            
           
        }
        
        
    }
    
    // add function 
  private  func addaTask(){
        if (viewModel.addTask(task: taskToAdd)){
            showAddTask.toggle()
            refreshTaskList.toggle()
            
        }
    }
}

#Preview {
    AddTaskView(viewModel: TaskViewModel(), showAddTask: .constant(false), refreshTaskList: .constant(false))
}
