//
//  TaskDetailsView.swift
//  LearningUI
//
//  Created by Prabhu Devar on 17/08/25.
//

import SwiftUI

struct TaskDetailsView: View {
    @ObservedObject var viewModel : TaskViewModel
    @Binding var selectedTask : Task
    @Binding var show : Bool
    
    
    var body: some View {
        NavigationStack{
            List{
               Section(header: Text("Task Details")){
                   TextField("Task Name", text: $selectedTask.name)
                   TextField("Task Discription", text: $selectedTask.description)
                   Toggle("Mark as complete", isOn: $selectedTask.isCompleted)
                   
                }
                Section(header: Text("Task Status")){
                    DatePicker("Task Date", selection: $selectedTask.finishedDate)
                }
                
                Section{
                    Button{} label:{
                        Text("Delete")
                            .font(.headline)
                            .foregroundStyle(.red)
                            .frame(maxWidth: .infinity,alignment: .center)
                    }
                }
            }
            .navigationTitle("Task Details")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {
                        self.show.toggle()
                    }){
                        Text("Cancel")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                    
                    }){
                        Text("Update")
                    }
                }
            }
        }
       
    }
}

#Preview {
    TaskDetailsView(viewModel: TaskViewModel(), selectedTask: .constant(Task.createMockTask().first!), show: .constant(false))
}
