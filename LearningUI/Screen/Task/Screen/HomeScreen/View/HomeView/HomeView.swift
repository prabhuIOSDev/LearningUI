//
//  HomeView.swift
//  LearningUI
//
//  Created by Prabhu Devar on 17/08/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject var taskviewModel:TaskViewModel = TaskViewModel() // stateobject and ObservedObject are similar but the difrence is wonership of taskviewmodel (viewModel)
    @State private var pickerFilter = ["Active","Completed"]
    @State private var defaultPickerSelection = "Active"
    @State private var showAddTaskView: Bool = false
    @State private var showTaskDetailView: Bool = false
    @State private var selectedTask: Task = Task(id: 0, name: "", description: "", isCompleted: false, finishedDate: Date())
    
    @State private var refreshTaskList : Bool = false
    
    var body: some View {
        
        NavigationStack{
            Picker("Picker Filter ",selection: $defaultPickerSelection
            ){
                ForEach(pickerFilter,id: \.self){
                    Text($0)
                }
            }
            .padding(.horizontal)
            .pickerStyle(.segmented)
                .onChange(of: defaultPickerSelection, initial: false) { _,_  in
                    taskviewModel.getTask(isActive: defaultPickerSelection == "Active")
                }
            
            List(taskviewModel.tasks,id:\.id){ task in
                VStack(alignment:.leading,spacing: 8){
                    Text(task.name)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundStyle( task.isCompleted ? Color.blue : Color.black)
                    HStack{
                        Text(task.description)
                            .font(.subheadline)
                            .fontWeight(.thin)
                            .foregroundStyle( task.isCompleted ? Color.blue : Color.black)
                        Spacer()
                        Text(task.finishedDate.toString())
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundStyle( task.isCompleted ? Color.blue.opacity(0.8) : Color.secondary)
                    }
                }
                .onTapGesture {
                    selectedTask = task
                    showTaskDetailView.toggle()
                }
                
            }
            .onAppear{
                taskviewModel.getTask(isActive: true)
            }
            .onChange(of: refreshTaskList, { _, _ in
                taskviewModel.getTask(isActive: defaultPickerSelection == "Active")
            })
            .navigationTitle("Your Task")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showAddTaskView = true
                    } label:{
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTaskView){
                AddTaskView(viewModel: taskviewModel, showAddTask: $showAddTaskView, refreshTaskList: $refreshTaskList)
                
            }
            .sheet(isPresented: $showTaskDetailView){
                TaskDetailsView(viewModel: taskviewModel, selectedTask: $selectedTask, show: $showTaskDetailView, refreshTaskList: $refreshTaskList)
            }
        }
        
        
    }
}

#Preview {
    HomeView()
}
