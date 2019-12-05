//
//  ColorData.swift
//  Parsing JSON Lab
//
//  Created by Christian Hurtado on 12/5/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//

import UIKit


struct ColorsArray {
    let colors: [Color]
}

struct Color: Decodable {
    let name: Name
    let rgb: Fraction
    let hex: HexVal
}

struct Fraction: Decodable {
    let fraction: RGBVal
}

struct RGBVal: Decodable {
    let r: CGFloat
    let g: CGFloat
    let b: CGFloat
}

struct HexVal: Decodable {
    let hex: Hex
}

struct Hex: Decodable {
    let value: String
    let clean: String
}

struct Name: Decodable {
    let value: String
}


//extension AllColors {
//static func getColors() -> [Color] {
//    var colors = [Color]()
//    do {
//        let data = Bundle.parseJSONData(filename: "Weather", ext: "json")
//        let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
//        citiesTemp = weatherData.list
//    } catch {
//        fatalError("\(error)")
//    }
//    return citiesTemp
//}

