//
//  SharedFunctionsAndConstant.swift
//  Reminders
//
//  Created by Yining Wang on 2022-01-26.
//

import Foundation
 
func getDocumentDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0]
}

let saveTasksLabel = "savedTasks"
