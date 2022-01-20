//
//  Task.swift
//  Reminders (iOS)
//
//  Created by Yining Wang on 2022-01-20.
//

import Foundation

struct Task: Identifiable {
    var id = UUID()
    var description: String
    var priority: TaskPriority
    var completed: Bool
    
    
    
    
}

let testData = [
    Task (description: "grow taller", priority:.high, completed: true)
 

]
