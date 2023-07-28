//
//  ProfileView.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
                VStack {
                    if let user = viewModel.user {
                        profile(user: user)
                    } else {
                        Text("Loading Profile...")
                    }
                }
                .navigationTitle("Profile")
            }
            .onAppear{
                viewModel.fetchUser()
            }
        }
        
        @ViewBuilder
        func profile(user: User) -> some View {
            // Avatar
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color.blue)
                .frame(width: 125, height: 125)
                .padding()
            // Info
            VStack(alignment: .leading) {
                HStack {
                    Text("Name: ")
                        .bold()
                    Text(user.name)
                }
                .padding()
                HStack {
                    Text("Email: ")
                        .bold()
                    Text(user.email)
                }
                .padding()
                HStack {
                    Text("Day Assigned: ")
                        .bold()
                    Text(user.day)
                    
                }
                .padding()
            }
            .padding()
            // Sign out
            Button("Log Out"){
                viewModel.logOut()
            }
            .tint(.red)
            .padding()
            
            Spacer()
        }
    }


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
