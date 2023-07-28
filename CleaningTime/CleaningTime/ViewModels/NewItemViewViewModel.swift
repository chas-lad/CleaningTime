//
//  NewItemViewViewModel.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//

import Foundation


class NewItemViewViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var showAlert = false
    
    init() {}
    
    func save(){}
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
}
