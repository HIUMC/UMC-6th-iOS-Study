//
//  ViewController.swift
//  udemySection4
//
//  Created by 이수현 on 4/6/24.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func ButtonTo2VC(_ sender: UIButton) {
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "nextViewController") as? nextViewController else {return}
        present(nextVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

