//
//  ContentView.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 20/07/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    
    var body: some View {
        // if we are signed in and have a current userID
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
        
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView{
            ToDoListView()
                .tabItem{
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("Profile", systemImage: "person.circle")
                }
            if viewModel.currentUserId == "mprG8UewspMZ2tYvsc43WrHp1NU2"
            {
                AssignmentView()
                    .tabItem{
                        Label("Assignment", systemImage: "person.fill.questionmark")
                    }
                HistoryView()
                    .tabItem{
                        Label("History", systemImage: "folder.badge.questionmark")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
