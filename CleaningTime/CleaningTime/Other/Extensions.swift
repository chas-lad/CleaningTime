//
//  Extensions.swift
//  CleaningTime
//
//  Created by Chas Ladhar on 22/07/2023.
//

import Foundation


// Extensions add additional functionality to an existing class, struct,, enum or protocol. (Kind of like @Override in Java)
// This particular extension is useful to add to our models to help convert to JSON string
extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            // we try and get data, if we fail we just return an empty dictionary
            return [:]
        }
        
        // try and convert to JSON
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
    }
}
