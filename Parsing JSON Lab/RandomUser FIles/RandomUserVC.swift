//
//  RandomUserVC.swift
//  Parsing JSON Lab
//
//  Created by Christian Hurtado on 12/5/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//

import UIKit

class RandomUserVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var userData = RandomUserData.getUsers(){
        didSet{
            tableView.reloadData()
        }
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}



extension RandomUserVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "randomUserCell", for: indexPath)
        let user = userData[indexPath.row]
        
        let fullName = "\(user.name.first) \(user.name.last)"
        
        cell.textLabel?.text = fullName
        cell.detailTextLabel?.text = user.email
        
        return cell
    }
}
