//
//  ToDoListViewViewModel.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

// ViewModel for list of items view
// Primary Tab
class ToDoListViewViewModel: ObservableObject{
    
    @Published var showingNewItemView = false
    @Published var userId = ""
    
    init() {
        
        guard let ID = Auth.auth().currentUser?.uid else {
            return
        }
        userId = ID
    }
    
    
    /// Delete to do list item
    /// - Parameter id: Item id to delete
    func delete(id : String) {
        let db = Firestore.firestore()
        
        db.collection("todos")
            .document(id)
            .delete()
    }
}
