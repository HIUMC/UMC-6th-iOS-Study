//
//  secondViewController.swift
//  tableViewStudy
//
//  Created by 이수현 on 4/8/24.
//

import UIKit

class secondViewController: UIViewController, ChangeLabelDelegate {
    func doChange() {
        previousViewController?.changedLabel.text = self.textField.text
    }
    
 
    @IBOutlet weak var textField: UITextField!
    var previousViewController : ViewController?
    
    @IBAction func buttonToFirstVC(_ sender: UIButton) {
        doChange()
        dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        previousViewController?.delegate = self
        
    }


}
