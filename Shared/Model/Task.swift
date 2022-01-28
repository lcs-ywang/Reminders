//
//  Task.swift
//  Reminders (iOS)
//
//  Created by Yining Wang on 2022-01-20.
//

import Foundation

enum TaskCodingKeys: CodingKey {
    case description
    case priority
    case completed
}


class Task: Identifiable, ObservableObject, Codable {
    var id = UUID()
    var description: String
    var priority: TaskPriority
    @Published var completed: Bool
    
    
    internal init(id: UUID = UUID(), description: String, priority: TaskPriority, completed: Bool) {
        self.id = id
        self.description = description
        self.priority = priority
        self.completed = completed
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: TaskCodingKeys.self)
        
        try container.encode(description, forKey: .description)
        try container.encode(priority.rawValue, forKey: .priority)
        try container.encode(completed, forKey: .completed)
    }
    
    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: TaskCodingKeys.self)
        
        self.description = try container.decode(String.self, forKey: .description)
        self.priority = try container.decode(TaskPriority.self, forKey: .priority)
        self.completed = try container.decode(Bool.self, forKey: .completed)

        
    }
    
}

let testData = [
    Task(description: "grow taller", priority:.high, completed: true)
 

]
