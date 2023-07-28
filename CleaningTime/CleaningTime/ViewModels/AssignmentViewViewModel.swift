//
//  AssignmentViewViewModel.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 28/07/2023.
//

import Foundation

class AssignmentViewViewModel: ObservableObject {
    
    @Published var selectedUserId: String = ""
    @Published var selectedDayIndex: String = ""
    
    init(){}
    
    func save() {
        print(selectedUserId)
        print(selectedDayIndex)
    }
}
