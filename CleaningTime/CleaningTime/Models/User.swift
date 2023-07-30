//
//  User.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//

import Foundation


// the 'completed' field is used to signify if a user has completed their cleaning for their designated DOW
// the day field tells us the user's assigned day of the week
struct User: Codable, Identifiable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    let completed: Bool
    let day: String
}
