//
//  AssignmentView.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 28/07/2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct AssignmentView: View {
    
    @StateObject var viewModel = AssignmentViewViewModel()
    @FirestoreQuery var users: [User]
    var weekdays: [String] = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

    init(){
        self._users = FirestoreQuery(collectionPath: "users")
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                List(users, id: \.id) { user in
                    HStack {
                        Text(user.name)
                        Text(user.day)
                        user.completed ? Text("Complete") : Text("Incomplete")
                    }
                }
        
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    Picker("Pick a user", selection: $viewModel.selectedUserId){
                        Text("No Option").tag(Optional<String>(nil))
                        ForEach(users, id: \.id) { user in
                            Text(user.name)
                        }
                    }
                    
                    Picker("Pick a day to assign", selection: $viewModel.selectedDay){
                        Text("No Option").tag(Optional<String>(nil))
                        ForEach(weekdays, id: \.self) { day in
                            Text(day)
                        }
                    }
                    CTButton(title: "Save", background: .teal) {
                        viewModel.save()
                    }
                
                }
            }
            .navigationTitle("Assignment")
        }
    }
}

struct AssignmentView_Previews: PreviewProvider {
    static var previews: some View {
        AssignmentView()
    }
}
