//
//  ViewController.swift
//  changingVC
//
//  Created by 이수현 on 4/29/24.
//

import UIKit

protocol changedLabelDelegate {
    func doChanged()
}

class ViewController: UIViewController {

    @IBOutlet weak var labelChanged: UILabel!
    
    @IBAction func buttonToNextVC(_ sender: Any) {
        guard let nextVC = storyboard?.instantiateViewController(identifier: "nextViewController") as? nextViewController else {return}
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var delegate : changedLabelDelegate?

}

