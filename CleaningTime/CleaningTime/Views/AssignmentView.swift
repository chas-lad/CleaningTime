//
//  AssignmentView.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 28/07/2023.
//

import SwiftUI

struct AssignmentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Assignments")
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
