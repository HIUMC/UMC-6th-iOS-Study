//
//  SecondViewController.swift
//  BMICalculator
//
//  Created by 이수현 on 6/27/24.
//

import UIKit

class SecondViewController: UIViewController {

    let greenView = UIView()
    let label_1 = UILabel()
    let calcBill = UILabel()
    let reCalc = UIButton()
    
    var receivedVal: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        greenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenView)
        greenView.backgroundColor = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 0.5)
        NSLayoutConstraint.activate([
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            greenView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
        label_1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label_1)
        label_1.text = "Total Per Person"
        label_1.textColor = .gray
        label_1.font = UIFont.systemFont(ofSize: 30)
        NSLayoutConstraint.activate([
            label_1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label_1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        
        calcBill.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calcBill)
        calcBill.text = receivedVal
        calcBill.textColor = .systemGreen
        calcBill.font = UIFont.systemFont(ofSize: 40)
        NSLayoutConstraint.activate([
            calcBill.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calcBill.topAnchor.constraint(equalTo: label_1.bottomAnchor, constant: 30)
        ])
        
        reCalc.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reCalc)
        reCalc.setTitle("Recalculate", for: .normal)
        reCalc.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        reCalc.titleLabel?.textColor = .white
        reCalc.backgroundColor = .systemGreen
        reCalc.layer.cornerRadius = 5
        reCalc.addTarget(self, action: #selector(previousVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            reCalc.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            reCalc.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
    }
    
    @objc func previousVC() {
        dismiss(animated: true, completion: nil)
    }
}
