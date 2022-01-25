//
//  ContentView.swift
//  Shared
//
//  Created by Yining Wang on 2022-01-20.
//

import SwiftUI

struct ContentView: View {
    
   
    @ObservedObject var store: TaskStore
    
    @State private var showingAddTask = false
    
    var body: some View {
        List{
            ForEach(store.tasks){task in
                TaskCell(task: task)
                   
              
            }
            .onDelete(perform: store.deleteItems)
            .onMove(perform: store.moveItems)
        }
        .navigationTitle("Reminders")
        .toolbar{
            ToolbarItem(placement: .primaryAction) {
                Button("Add"){
                    showingAddTask = true
                }
            }
            ToolbarItem(placement: .navigationBarLeading){
                EditButton()
            }
        }
        .sheet(isPresented: $showingAddTask){
            AddTask(store: store, showing: $showingAddTask)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: testStore)
    }
}
