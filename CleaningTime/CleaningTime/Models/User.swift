//
//  User.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
    let completed: Bool
}
