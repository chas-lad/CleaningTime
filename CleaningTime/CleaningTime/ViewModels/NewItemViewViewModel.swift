//
//  NewItemViewViewModel.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation


class NewItemViewViewModel: ObservableObject{
    
    @Published var title = ""
    @Published var showAlert = false
    
    init() {}
    
    func save(){
        // Performing another check just for sanity
        guard canSave else {
            return
        }
        
//        Get current user id
//        guard let uId = Auth.auth().currentUser?.uid else {
//            return
//        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   isDone: false)
        
        // Save model
        let db = Firestore.firestore()
        
        db.collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        return true
    }
}
