//
//  DetailRandomUserVC.swift
//  Parsing JSON Lab
//
//  Created by Christian Hurtado on 12/6/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//

import UIKit

class DetailRandomUserVC: UIViewController {
    
    var randomUser: Information!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var postcodeLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var birthdayLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel?.text = "\(randomUser.name.title) \(randomUser.name.first) \(randomUser.name.last)"
        streetLabel?.text = "\(randomUser.location.street.number) \(randomUser.location.street.name)"
        cityLabel?.text = "\(randomUser.location.city),\(randomUser.location.state),\(randomUser.location.country)"
        postcodeLabel?.text = "\(randomUser.location.postcode)"
        phoneLabel?.text = randomUser.cell
        birthdayLabel?.text = randomUser.dob.date

    }
    

}
