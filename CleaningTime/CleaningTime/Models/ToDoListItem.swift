//
//  ToDoListItem.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
