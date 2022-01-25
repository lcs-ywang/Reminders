//
//  TextCell.swift
//  Reminders
//
//  Created by Yining Wang on 2022-01-20.
//

import SwiftUI

struct TaskCell: View {
    
    var task: Task
    
    var body: some View {
        HStack{
            Image(systemName: task.completed ? "checkmarl.circlec.fill" : "circle")
                .onTapGesture {
                    task.completed.toggle()
                }
        }
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: testData[0])
        TaskCell(task: testData[1])
    }
}
