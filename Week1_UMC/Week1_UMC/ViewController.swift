//
//  ViewController.swift
//  Week1_UMC
//
//  Created by 김도연 on 4/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topBtn: UIButton!
    @IBOutlet weak var adButton: UIButton!
    
    @IBOutlet weak var deliveryBtn: UIButton!
    @IBOutlet weak var normalDeliveryBtn: UIButton!
    @IBOutlet weak var bmartBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
        
    }

    func setUI() {
        topBtn.setTitle("집콕러세요? 30% 쿠폰 드려요!", for: .normal)
    }
}

