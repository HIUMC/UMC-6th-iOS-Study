//
//  nextViewController.swift
//  changingVC
//
//  Created by 이수현 on 4/29/24.
//

import UIKit



class nextViewController: UIViewController, changedLabelDelegate {
    func doChanged() {
        previousViewController?.labelChanged.text = self.textField.text
    }
    
    @IBAction func buttonToBack(_ sender: Any) {
        doChanged()
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousViewController?.delegate = self
        // Do any additional setup after loading the view.
    }
    

    
    var previousViewController : ViewController?
}
