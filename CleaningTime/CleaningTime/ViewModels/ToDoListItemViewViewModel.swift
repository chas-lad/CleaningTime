//
//  ToDoListItemViewViewModel.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//

import FirebaseFirestore
import Foundation

// ViewModel for single to do list item view (each row in items list)
class ToDoListItemViewViewModel: ObservableObject{
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        let db = Firestore.firestore()
        db.collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
