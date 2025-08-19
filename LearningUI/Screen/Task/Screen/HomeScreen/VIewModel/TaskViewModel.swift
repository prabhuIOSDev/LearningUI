//
//  TaskViewModel.swift
//  LearningUI
//
//  Created by Prabhu Devar on 17/08/25.
//

import Foundation

final class TaskViewModel:ObservableObject {
    
    @Published var tasks:[Task] = []
    private var tempTasks = Task.createMockTask()
    
    func getTask(isActive:Bool){
        tasks = tempTasks.filter({$0.isCompleted == !isActive})
    }
    
    
    // add task ...
    func addTask(task:Task) ->Bool{
        let taskId = Int.random(in: 4...100)
        let taskToAdd = Task(id:taskId, name:task.name,description: task.description,isCompleted: task.isCompleted,finishedDate: task.finishedDate)
        tempTasks.append(taskToAdd)
        return true
    }
    
    // update task ::
    func updateTask(task:Task) ->Bool{
        
        if let index = tempTasks.firstIndex(where: {$0.id == task.id}){
            
            tempTasks[index].name = task.name
            tempTasks[index].description = task.description
            tempTasks[index].isCompleted = task.isCompleted
            tempTasks[index].finishedDate = task.finishedDate
            return true
        }
        return false
        
    }
    
    // delete task
    func deleteTask(task:Task) ->Bool{
        
        if let index = tempTasks.firstIndex(where: {$0.id == task.id}){
            tempTasks.remove(at: index)
            
            return true
        }
        
        
        return false
    }
    
}
