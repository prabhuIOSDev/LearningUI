//
//  TaskModel.swift
//  LearningUI
//
//  Created by Prabhu Devar on 17/08/25.
//

import Foundation

struct Task{
    var id:Int
    var name:String
    var description:String
    var isCompleted:Bool
    var finishedDate:Date
    
    static func createMockTask() -> [Task]{
        
        return[
            Task(id: 1, name: "Ui learning with swift and swiftui also flutter and react native ", description: "We have to learn all", isCompleted: false, finishedDate: Date()),
            Task(id: 2, name: "Api Integration", description: "Task management", isCompleted: false, finishedDate: Date()),
            Task(id: 3, name: "Push Notification", description: "Firebase push notification", isCompleted: true, finishedDate: Date())
        ]
    }
    
    
    
    
}
    
