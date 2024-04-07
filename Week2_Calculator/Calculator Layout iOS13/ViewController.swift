//
//  ViewController.swift
//  Calculator Layout iOS13
//
//  Created by Angela Yu on 01/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var PercentBtn: UIButton!
    @IBOutlet weak var AddButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }

    func setUI() {
        PercentBtn.layer.masksToBounds = true
        AddButton.layer.masksToBounds = true
        PercentBtn.layer.cornerRadius = PercentBtn.layer.frame.size.width / 2
        AddButton.layer.cornerRadius = AddButton.layer.frame.size.width / 2
    }
}

