//
//  ViewController.swift
//  calculator
//
//  Created by 이현주 on 4/1/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var acBtn: RoundButton!
    @IBOutlet weak var plmiBtn: RoundButton!
    @IBOutlet weak var percentBtn: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        acBtn.layer.masksToBounds = true
        plmiBtn.layer.masksToBounds = true
        percentBtn.layer.masksToBounds = true
        // Do any additional setup after loading the view.
    }


}

