//
//  ColorsViewController.swift
//  Parsing JSON Lab
//
//  Created by Christian Hurtado on 12/5/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//

import UIKit

class ColorsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var colorData = ColorsData.getColors() {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        tableView.dataSource = self
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailColorsVC = segue.destination as? DetailColorsVC,
        let indexPath = tableView.indexPathForSelectedRow else{
            fatalError("Failed to get indexPath and detailViewController!")
        }
        detailColorsVC.color = colorData[indexPath.row]
    }
    
}

extension ColorsVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell", for: indexPath)
        let color = colorData[indexPath.row]
        
        cell.textLabel?.text = color.name.value
        cell.detailTextLabel?.text = color.hex.clean
        cell.backgroundColor? = UIColor(red: color.rgb.fraction.r, green: color.rgb.fraction.g, blue: color.rgb.fraction.b, alpha: 0.9)
        
        return cell
    }
    
    
}
