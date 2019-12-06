//
//  RandomUserData.swift
//  Parsing JSON Lab
//
//  Created by Christian Hurtado on 12/5/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//

import Foundation

struct RandomUserData: Decodable {
    let results: [Information]
}

struct Information: Decodable {
    let gender: String
    let name: NameInfo
    let location: Location
}

struct NameInfo: Decodable {
    let title: String
    let first: String
    let last: String
}

struct Location: Decodable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Int
}

struct Street: Decodable {
    let number: Int
    let name: String
}

extension RandomUserData {
    static func getUsers() -> [Information] {
        var users = [Information]()
        do {
            let data = Bundle.parseJSONData(filename: "RandomUser", ext: "json")
            let userData = try JSONDecoder().decode(RandomUserData.self, from: data)
            users = userData.results
        } catch {
            fatalError("\(error)")
        }
        return users
    }
}

