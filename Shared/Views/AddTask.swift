//
//  AddTask.swift
//  Reminders
//
//  Created by Yining Wang on 2022-01-20.
//

import SwiftUI

struct AddTask: View {
    
    @ObservedObject var store: TaskStore
    
    @State private var description = ""
    @State private var priority = TaskPriority.low
    
    @Binding var showing: Bool
    
    var body: some View {
        NavigationView{
            VStack{
                
                Form {
                    TextField("Description", text: $description)
                    
                    Picker("Priority", selection: $priority) {
                        Text(TaskPriority.low.rawValue).tag(TaskPriority.low)
                        Text(TaskPriority.medium.rawValue).tag(TaskPriority.medium)
                        Text(TaskPriority.high.rawValue).tag(TaskPriority.high)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
            }
            .navigationTitle("New Reminder")
            .toolbar{
                ToolbarItem(placement: .primaryAction){
                    Button("Save"){
                         saveTask()
                    }
                    .disabled(description.isEmpty)
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        showing = false
                    }
                }
            }
            
        }
        .interactiveDismissDisabled()
        
    }
    
    
    
    func saveTask(){
        
        
        store.tasks.append(Task(description: description,
                                priority: priority,
                                completed: false
        ))
        
        showing = false
        
        
    }
}

struct AddTask_Previews: PreviewProvider {
    static var previews: some View {
        AddTask(store: testStore, showing: .constant(true))
    }
}
