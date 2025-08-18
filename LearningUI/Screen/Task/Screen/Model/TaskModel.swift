//
//  TaskModel.swift
//  LearningUI
//
//  Created by Prabhu Devar on 17/08/25.
//

import Foundation

struct Task{
    let id:Int
    let name:String
    let description:String
    let isActive:Bool
    let finishedDate:Date
    
    static func createMockTask() -> [Task]{
        
        return[
            Task(id: 1, name: "Ui learning with swift and swiftui also flutter and react native ", description: "We have to learn all", isActive: true, finishedDate: Date()),
            Task(id: 2, name: "Api Integration", description: "Task management", isActive: true, finishedDate: Date()),
            Task(id: 3, name: "Push Notification", description: "Firebase push notification", isActive: false, finishedDate: Date())
        ]
    }
    
    
    
    
}
    
