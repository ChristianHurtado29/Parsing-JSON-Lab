//
//  ColorData.swift
//  Parsing JSON Lab
//
//  Created by Christian Hurtado on 12/5/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//

import UIKit


struct ColorsData:Decodable {
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
    let value: String
    let clean: String
}


struct Name: Decodable {
    let value: String
}


extension ColorsData {
    
static func getColors() -> [Color] {
    var colors = [Color]()
    do {
        let data = Bundle.parseJSONData(filename: "Color", ext: "json")
        let colorData = try JSONDecoder().decode(ColorsData.self, from: data)
        colors = colorData.colors
    } catch {
        fatalError("\(error)")
    }
    return colors
}
}
