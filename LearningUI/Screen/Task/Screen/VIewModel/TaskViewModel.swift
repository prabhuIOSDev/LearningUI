//
//  TaskViewModel.swift
//  LearningUI
//
//  Created by Prabhu Devar on 17/08/25.
//

import Foundation

final class TaskViewModel:ObservableObject {
    
    @Published var tasks:[Task] = []
    
    func getTask(isActive:Bool){
        tasks = Task.createMockTask().filter({$0.isActive == isActive})
    }
    
    
}
