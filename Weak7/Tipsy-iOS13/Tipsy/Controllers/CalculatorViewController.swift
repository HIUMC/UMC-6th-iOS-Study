//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    var result = "0.0"
    var tip = 10
    var split = 2
    // MARK: IBOutlet
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    // MARK: IBAction
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        split = Int(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if zeroPctButton.isSelected {
            let num = Float(billTextField.text!)
            let ppl = Float(splitNumberLabel.text!)
            result = String((num!*1.0)/ppl!)
            tip = 0
        }
        if tenPctButton.isSelected {
            let num = Float(billTextField.text!)
            let ppl = Float(splitNumberLabel.text!)
            result = String((num!*1.1)/ppl!)
            tip = 10
        }
        if twentyPctButton.isSelected {
            let num = Float(billTextField.text!)
            let ppl = Float(splitNumberLabel.text!)
            result = String((num!*1.2)/ppl!)
            tip = 20
        }
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = self.result
            destinationVC.tip = self.tip
            destinationVC.split = self.split
        }
    }

}

