//
//  DetailWeatherVCViewController.swift
//  Parsing JSON Lab
//
//  Created by Christian Hurtado on 12/5/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//

import UIKit

class DetailWeatherVC: UIViewController {
    
    var city: ListInfo!
    
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var tempStat: UILabel!
    
    @IBOutlet weak var tempDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        cityLabel.text = city.name
        tempLabel.text = "Temp: \(city.main.temp.description)"
        tempStat.text = "Weather status: \(city.weather.first?.main ?? "")"
        tempDescription.text = city.weather.first?.description
        dump(WeatherData.getCities())
    }
    
}
