//
//  ViewController.swift
//  tableViewStudy
//
//  Created by 이수현 on 4/8/24.
//

import UIKit

protocol ChangeLabelDelegate{
    func doChange()
}

class ViewController: UIViewController {

    @IBOutlet weak var changedLabel: UILabel!
    
    @IBAction func buttonToNextVC(_ sender: UIButton) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "secondViewController") as? secondViewController else {return}
        nextVC.previousViewController = self
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    var delegate : ChangeLabelDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

