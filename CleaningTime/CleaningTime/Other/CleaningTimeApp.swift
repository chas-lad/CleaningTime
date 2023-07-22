//
//  CleaningTimeApp.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 20/07/2023.
//
import FirebaseCore
import SwiftUI

@main
struct CleaningTimeApp: App {
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
