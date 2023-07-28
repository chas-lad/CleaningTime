//
//  ToDoListItemsView.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    
    private let userId: String
    
    init(userId: String){
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("Cleaning List")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                }
                label : {
                    Image(systemName: "plus")
                }
            }
            // .sheet method is used to prevent a modal view when a boolean value is true
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "")
    }
}
