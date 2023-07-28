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
    @Published var user: User? = nil
    @Published var weekday = Date().formatted(.dateTime.weekday(.wide))
    
    init() {
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        // fetch data from db concerning the current user/userId
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(
                    id: data["id"] as? String ?? "",
                    name: data["name"] as? String ?? "",
                    email: data["email"] as? String ?? "",
                    joined: data["joined"] as? TimeInterval ?? 0,
                    completed: data["completed"] as? Bool ?? false,
                    day: data["day"] as? String ?? ""
                )
            }
        }
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
