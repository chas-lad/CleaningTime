//
//  AssignmentViewViewModel.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 28/07/2023.
//

import FirebaseFirestore
import Foundation

class AssignmentViewViewModel: ObservableObject {
    
    @Published var selectedUserId: String = ""
    @Published var selectedDay: String = "Monday"
    @Published var errorMessage = ""
    
    init(){
    
    }
    
    func save() {
        print(selectedUserId)
        print(selectedDay)
        
        guard validate() else {
            errorMessage = "Select a user and day"
            return
        }
        
        let db = Firestore.firestore()
                db.collection("users").whereField("id", isEqualTo: selectedUserId).getDocuments { (result, error) in
                    if error == nil{
                        for document in result!.documents{
                            db.collection("users").document(document.documentID).setData([ "day": self.selectedDay ], merge: true)
                        }
                    }
                }
    }
    
    private  func validate() -> Bool {
        errorMessage = ""
        
        guard selectedUserId != "" else {
            return false
        }
        
        guard selectedDay != "" else {
            return false
        }
        
        return true
    }
}
