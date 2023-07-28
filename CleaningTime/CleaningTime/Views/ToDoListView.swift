//
//  ToDoListItemsView.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//
import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel = ToDoListViewViewModel()
    // The @FirestoreQuery property wrapper is constantly listening to the collection path we specify
    @FirestoreQuery var items: [ToDoListItem]
    
    
    init(){
        self._items = FirestoreQuery(collectionPath: "todos")
    }
    
    var body: some View {
        
        if let user = viewModel.user {
            if viewModel.weekday == user.day {
                NavigationView {
                    VStack {
                        List(items) { item in
                            ToDoListItemView(item: item)
                                .swipeActions{
                                    if user.id == "mprG8UewspMZ2tYvsc43WrHp1NU2"
                                    {
                                        Button("Delete"){
                                            viewModel.delete(id: item.id)
                                        }
                                        .tint(.red)
                                    }
                                }
                        }
                        .listStyle(PlainListStyle())
                    }
                    .navigationTitle("Cleaning List")
                    .toolbar{
                        
                        if user.id == "mprG8UewspMZ2tYvsc43WrHp1NU2"
                        {
                            Button{
                                viewModel.showingNewItemView = true
                            }
                            label : {
                                Image(systemName: "plus")
                            }
                        }
                        
                    }
                    // .sheet method is used to prevent a modal view when a boolean value is true
                    .sheet(isPresented: $viewModel.showingNewItemView) {
                        NewItemView(newItemPresented: $viewModel.showingNewItemView)
                    }
                }
            }
            else{
                Text("Today is not your day to clean! Or you haven't been assigned a day! Ask your admin (Chas) to delegate a day to you.")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .frame(width: 300)
            }
        }
    }
}

struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}
