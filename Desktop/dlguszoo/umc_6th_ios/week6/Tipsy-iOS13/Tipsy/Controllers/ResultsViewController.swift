//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by 이현주 on 5/18/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    var splitNum: Int?
    var tip: Int?
    var total: String?

    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = total!
        settingsLabel.text = "Split between \(splitNum!) people, with \(tip!)% tip."

        // Do any additional setup after loading the view.
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
