//
//  WeatherData.swift
//  Parsing JSON Lab
//
//  Created by Christian Hurtado on 12/4/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let list:[ListInfo]
}

struct ListInfo: Decodable {
    let name: String
    let main: MainInfo
    let weather: [WeatherInfo]
}

struct MainInfo: Decodable {
    let temp: Double
}

struct WeatherInfo: Decodable {
    let main: String
    let description: String
}

extension WeatherData {
static func getCities() -> [ListInfo] {
    var citiesTemp = [ListInfo]()
    do {
        let data = Bundle.parseJSONData(filename: "Weather", ext: "json")
        let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
        citiesTemp = weatherData.list
    } catch {
        fatalError("\(error)")
    }
    return citiesTemp
}
}
