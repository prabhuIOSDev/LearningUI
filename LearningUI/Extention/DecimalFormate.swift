//
//  DecimalFormate.swift
//  LearningUI
//
//  Created by Prabhu Devar on 02/09/25.
//

import Foundation

extension Double{
    var oneDecimalPlace: String{
        return String(format: "%.1f", self)
    }
}
