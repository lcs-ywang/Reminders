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
        
        let filename = getDocumentDirectory().appendingPathComponent(saveTasksLabel)
        print(filename)
        
        do {
            
            let data = try Data(contentsOf: filename)
            
            print("Got data from data, contents are: ")
            print(String(data: data, encoding: .utf8))
            
            self.tasks = try JSONDecoder().decode([Task].self, from: data)
            
        } catch {
            print(error.localizedDescription)
            print("Could not load data from file, initializing with tasks provided to initializer")
            
            self.tasks = tasks
            
        }
        
    }
    
    func deleteItems(at offsets: IndexSet){
        
        tasks.remove(atOffsets: offsets)
        
    }
    
    func moveItems(from source: IndexSet, to destination : Int){
        
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func persistTasks() {
        let filename = getDocumentDirectory().appendingPathComponent(saveTasksLabel)
        
        do {
            let encoder = JSONEncoder()
            
            encoder.outputFormatting = .prettyPrinted
            
            let data = try encoder.encode(self.tasks)
            
            try data.write(to: filename, options: [.atomicWrite, .completeFileProtection])
            
            
            print("Saved data to documents directory succedfully.")
            print("===")
            print(String(data: data, encoding: .utf8))
            
        } catch {
            
            print(error.localizedDescription)
            print("Unable to write list of tasks to documents directory in app bundle on device")
            
        }
        
    }
    
}

let testStore = TaskStore(tasks: testData)
