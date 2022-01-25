//
//  TaskStore.swift
//  Reminders (iOS)
//
//  Created by Yining Wang on 2022-01-20.
//

import Foundation

class TaskStore: ObservableObject{
    @Published var tasks: [Task]
    
    init(tasks: [Task] = []){
        self.tasks = tasks
    }
    
    func deleteItems(at offsets: IndexSet){
        
        tasks.remove(atOffsets: offsets)
        
    }
    
    func moveItems(from source: IndexSet, to destination : Int){
        
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
}

let testStore = TaskStore(tasks: testData)
