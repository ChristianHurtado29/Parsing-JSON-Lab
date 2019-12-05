//
//  WeatherViewController.swift
//  Parsing JSON Lab
//
//  Created by Christian Hurtado on 12/5/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var city = WeatherData.getCities() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        tableView.dataSource = self
    }

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailWeatherVC = segue.destination as? DetailWeatherVC,
             let indexPath = tableView.indexPathForSelectedRow else{
            fatalError("Failed to get indexPath and detailViewController!")
        }
    detailWeatherVC.city = city[indexPath.row]
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WeatherData.getCities().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        let city = WeatherData.getCities()[indexPath.row]
        
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = "Temp: C \(city.main.temp.description)"
        
        return cell
    }
}
