//
//  ToDoListItemViewViewModel.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//
import FirebaseAuth
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
        
        checkCompletion()
    }
    
    private func checkCompletion() {
        
        let db = Firestore.firestore()
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        var incompleteTasks = false
        db.collection("todos").getDocuments { (result, error) in
            if error == nil{
                for document in result!.documents{
                    let isDone = document.data()["isDone"] as! Bool // type cast to prevent working with Any? type
                    print(isDone)
                   
                    if isDone == false {
                        incompleteTasks = true
                    }
                }
                print("incompleteTasks = ", incompleteTasks)
                
                // Set the current logged in user's 'completed' field to false if they still have incomplete tasks
                if incompleteTasks == true{
                    db.collection("users").whereField("id", isEqualTo: userId).getDocuments { (result, error) in
                        if error == nil{
                            for document in result!.documents{
                                db.collection("users").document(document.documentID).setData([ "completed" : false ], merge: true)
                            }
                        }
                    }
                    return
                }
                // Set the current logged in user's 'completed' field to false if they have completed all their tasks
                else {
                    db.collection("users").whereField("id", isEqualTo: userId).getDocuments { (result, error) in
                        if error == nil{
                            for document in result!.documents{
                                db.collection("users").document(document.documentID).setData([ "completed" : true ], merge: true)
                            }
                        }
                    }
                    return
                }
            }
        }

    }
    
}
