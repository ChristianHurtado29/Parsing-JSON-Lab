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
    let email: String
    let dob: Birth
    let phone: String
    let cell: String
    let picture: Pic
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
    let postcode: Postcode
}

struct Birth: Decodable {
    let date: String
    let age: Int
}

struct Pic: Decodable {
    let large: String
    let medium: String
    let thumbnail: String
}

enum Postcode: Decodable {
    case int(Int)
    case string(String) // associative values
    
    init(from decoder: Decoder) throws {
        if let intValue = try? decoder.singleValueContainer().decode(Int.self) {
            self = .int(intValue)
            return
        }
        if let stringValue = try? decoder.singleValueContainer().decode(String.self) {
            self = .string(stringValue)
            return
        }
        throw AppError.missingValue
    }
}

enum AppError: Error {
    case missingValue
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

