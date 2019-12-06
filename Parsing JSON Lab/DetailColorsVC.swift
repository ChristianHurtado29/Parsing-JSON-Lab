//
//  DetailColorsVC.swift
//  Parsing JSON Lab
//
//  Created by Christian Hurtado on 12/5/19.
//  Copyright © 2019 Christian Hurtado. All rights reserved.
//

import UIKit

class DetailColorsVC: UIViewController {
    
    var color: Color!

    @IBOutlet weak var hexNum: UILabel!
    @IBOutlet weak var redVal: UILabel!
    @IBOutlet weak var greenVal: UILabel!
    @IBOutlet weak var blueVal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presentR = color.rgb.fraction.r * 100
        let presentG = color.rgb.fraction.g * 100
        let presentB = color.rgb.fraction.b * 100
        
        hexNum.text = color.hex.clean
        redVal.text = "R: \(Double(presentR).description)"
        redVal.textColor = .red
        greenVal.text = "G: \(Double(presentG).description)"
        greenVal.textColor = .green
        blueVal.text = "B: \(Double(presentB).description)"
        blueVal.textColor = .blue
    }
    

}
