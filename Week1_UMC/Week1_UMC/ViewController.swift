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
    
    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var StackLabel1: UILabel!
    @IBOutlet weak var StackLabel2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
        
    }

    func setUI() {
        topBtn.setTitle("집콕러세요? 30% 쿠폰 드려요!", for: .normal)
        deliveryBtn.setTitle("알뜰배달", for: .normal)
        deliveryBtn.titleLabel?.font = UIFont(name: "Impact", size: 24)
        normalDeliveryBtn.setTitle("배달", for: .normal)
        normalDeliveryBtn.titleLabel?.font = UIFont(name: "Impact", size: 24)
        bmartBtn.setTitle("배민스토어", for: .normal)
        bmartBtn.titleLabel?.font = UIFont(name: "Impact", size: 24)
        
        StackLabel1.text = "대용량특가"
        StackLabel1.font = UIFont(name: "Impact", size: 25)
        StackLabel2.text = "많이 살수록 더 저렴하죠"
        
        adButton.setTitle("신전떡볶이 특급 할인", for: .normal)
        adButton.titleLabel?.font = UIFont(name: "Impact", size: 24)
        
        cornerView.clipsToBounds = true
        cornerView.layer.cornerRadius = 20
        cornerView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
    }
}

