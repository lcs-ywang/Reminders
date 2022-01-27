//
//  TextCell.swift
//  Reminders
//
//  Created by Yining Wang on 2022-01-20.
//

import SwiftUI

struct TaskCell: View {
    
   @ObservedObject var task: Task
    
    @Binding var triggerListUpdate: Bool
    
    var taskColour: Color {
        
        switch task.priority {
        case .high:
            return Color.red
        case .medium:
            return Color.blue
        case.low:
            return Color.primary
        
        }
    }
    
    var body: some View {
        HStack{
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .onTapGesture {
                    task.completed.toggle()
                    
                    withAnimation{
                        triggerListUpdate.toggle() 
                    }
                }
            Text(task.description)
        }
        .foregroundColor(self.taskColour)
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: testData[0], triggerListUpdate: .constant(true))
        TaskCell(task: testData[1], triggerListUpdate: .constant(true))
    }
}
