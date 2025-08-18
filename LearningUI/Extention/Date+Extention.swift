//
//  Date+Extention.swift
//  LearningUI
//
//  Created by Prabhu Devar on 17/08/25.
//

import Foundation

extension Date {
    func toString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        let result = dateFormatter.string(from: self)
        return result
    }
        
    
}
