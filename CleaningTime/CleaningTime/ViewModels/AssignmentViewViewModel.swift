//
//  AssignmentViewViewModel.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 28/07/2023.
//

import Foundation

class AssignmentViewViewModel: ObservableObject {
    
    @Published var selectedUserId: String = ""
    @Published var selectedDay: String = "Monday"
    
    init(){
    
    }
    
    func save() {
        print(selectedUserId)
        print(selectedDay)
    }
}
