//
//  ViewController.swift
//  BMICalculator
//
//  Created by 이수현 on 6/27/24.
//

import UIKit

class ViewController: UIViewController {

    let greenView = UIView()
    let billTextField = UITextField()
    let zeroPctButton = UIButton()
    let tenPctButton = UIButton()
    let twentyPctButton = UIButton()
    let splitNumLabel = UILabel()
    let label_1 = UILabel()
    let label_2 = UILabel()
    let label_3 = UILabel()
    let stepper = UIStepper()
    let calcButton = UIButton()
    
    var total: Float = 0.0
    var percentage: Float = 0.1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Green View
        greenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(greenView)
        greenView.backgroundColor = UIColor(red: 144/255, green: 238/255, blue: 144/255, alpha: 0.5)
        NSLayoutConstraint.activate([
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
        
        // MARK: Labels
        label_1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label_1)
        label_1.text = "Enter bill total"
        label_1.textColor = .gray
        label_1.font = UIFont.systemFont(ofSize: 20)
        NSLayoutConstraint.activate([
            label_1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            label_1.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
        ])
        
        label_2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label_2)
        label_2.text = "Select tip"
        label_2.textColor = .gray
        label_2.font = UIFont.systemFont(ofSize: 20)
        NSLayoutConstraint.activate([
            label_2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            label_2.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 30)
        ])
        
        label_3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label_3)
        label_3.text = "Choose Split"
        label_3.textColor = .gray
        label_3.font = UIFont.systemFont(ofSize: 20)
        NSLayoutConstraint.activate([
            label_3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            label_3.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 200)
        ])
        
        splitNumLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(splitNumLabel)
        splitNumLabel.text = "2"
        splitNumLabel.textColor = .black
        splitNumLabel.font = UIFont.systemFont(ofSize: 30)
        NSLayoutConstraint.activate([
            splitNumLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            splitNumLabel.bottomAnchor.constraint(equalTo: label_3.bottomAnchor, constant: 50)
        ])
        
        // MARK: TextField
        billTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(billTextField)
        billTextField.placeholder = "e.g 123.56"
        billTextField.font = UIFont.systemFont(ofSize: 40)
        billTextField.textAlignment = .center
        NSLayoutConstraint.activate([
            billTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            billTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 120)
        ])
        
        // MARK: Buttons
        tenPctButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tenPctButton)
        tenPctButton.setTitle("10%", for: .normal)
        tenPctButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        tenPctButton.setTitleColor(.white, for: .normal)
        tenPctButton.backgroundColor = .systemGreen
        tenPctButton.layer.cornerRadius = 5
        tenPctButton.addTarget(self, action: #selector(percentageVal(_ : )), for: .touchUpInside)
        NSLayoutConstraint.activate([
            tenPctButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tenPctButton.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 85)
        ])
        
        zeroPctButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(zeroPctButton)
        zeroPctButton.setTitle("0%", for: .normal)
        zeroPctButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        zeroPctButton.setTitleColor(.white, for: .normal)
        zeroPctButton.backgroundColor = .clear
        zeroPctButton.layer.cornerRadius = 5
        zeroPctButton.addTarget(self, action: #selector(percentageVal(_ : )), for: .touchUpInside)
        NSLayoutConstraint.activate([
            zeroPctButton.trailingAnchor.constraint(equalTo: tenPctButton.leadingAnchor, constant: -50),
            zeroPctButton.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 85)
        ])
        
        twentyPctButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(twentyPctButton)
        twentyPctButton.setTitle("20%", for: .normal)
        twentyPctButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        twentyPctButton.setTitleColor(.white, for: .normal)
        twentyPctButton.backgroundColor = .clear
        twentyPctButton.layer.cornerRadius = 5
        twentyPctButton.addTarget(self, action: #selector(percentageVal(_ : )), for: .touchUpInside)
        NSLayoutConstraint.activate([
            twentyPctButton.leadingAnchor.constraint(equalTo: tenPctButton.trailingAnchor, constant: 50),
            twentyPctButton.topAnchor.constraint(equalTo: greenView.topAnchor, constant: 85)
        ])
        
        calcButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(calcButton)
        calcButton.setTitle("Calculate", for: .normal)
        calcButton.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        calcButton.setTitleColor(.white, for: .normal)
        calcButton.backgroundColor = .systemGreen
        calcButton.layer.cornerRadius = 5
        calcButton.addTarget(self, action: #selector(toNextVC), for: .touchUpInside)
        NSLayoutConstraint.activate([
            calcButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calcButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -45)
        ])
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stepper)
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        stepper.stepValue = 1
        stepper.value = 2
        stepper.addTarget(self, action: #selector(changePeopleNum( _: )), for: .valueChanged)
        NSLayoutConstraint.activate([
            stepper.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -120),
            stepper.bottomAnchor.constraint(equalTo: label_3.bottomAnchor, constant: 50)
        ])
    }

    @objc func changePeopleNum(_ sender: UIStepper) {
        splitNumLabel.text = "\(Int(sender.value))"
    }
    
    @objc func toNextVC(_ sender: UIButton) {
        calculatePrice()
        let nextVC = SecondViewController()
        nextVC.receivedVal = String(total)
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true, completion: nil)
    }
    
    @objc func percentageVal(_ sender: UIButton) {
        if sender.titleLabel?.text == "0%" {
            percentage = 0
            zeroPctButton.backgroundColor = .systemGreen
            tenPctButton.backgroundColor = .clear
            twentyPctButton.backgroundColor = .clear
        } else if sender.titleLabel?.text == "10%" {
            percentage = 0.1
            zeroPctButton.backgroundColor = .clear
            tenPctButton.backgroundColor = .systemGreen
            twentyPctButton.backgroundColor = .clear
        } else {
            percentage = 0.2
            zeroPctButton.backgroundColor = .clear
            tenPctButton.backgroundColor = .clear
            twentyPctButton.backgroundColor = .systemGreen
        }
    }
    @objc func calculatePrice() {
        let price = Float(billTextField.text!)
        total = (price! * (1+percentage)) / Float(stepper.value)
    }
}

