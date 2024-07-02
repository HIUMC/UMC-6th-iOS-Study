//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by 이수현 on 6/26/24.
//

import UIKit

class ViewController: UIViewController {

    let phrases = ["Of course.", "Of course not.", "Hell no", "Shut up"]
    let label_1 = UILabel()
    let label_2 = UILabel()
    let ask_Button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        label_1.translatesAutoresizingMaskIntoConstraints = false
        
        label_1.text = "Ask Me Anything..."
        label_1.textColor = .white
        label_1.font = UIFont.systemFont(ofSize: 25)
        label_1.textAlignment = .center
        
        view.addSubview(label_1)
        
        label_1.widthAnchor.constraint(equalToConstant: 400).isActive = true
        label_1.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        label_1.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label_1.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        label_2.translatesAutoresizingMaskIntoConstraints = false
        label_2.text = "Waiting for your Question.."
        label_2.textColor = .black
        label_2.font = UIFont.systemFont(ofSize: 28)
        label_2.textAlignment = .center
        
        view.addSubview(label_2)
        
        label_2.widthAnchor.constraint(equalToConstant: 400).isActive = true
        label_2.heightAnchor.constraint(equalToConstant: 300).isActive = true
        label_2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label_2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
        ask_Button.translatesAutoresizingMaskIntoConstraints = false
        
        ask_Button.setTitle("ASK", for: .normal)
        ask_Button.backgroundColor = .white
        ask_Button.setTitleColor(.black, for: .normal)
        ask_Button.titleLabel?.textAlignment = .center
        ask_Button.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        ask_Button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view.addSubview(ask_Button)
        
        ask_Button.widthAnchor.constraint(equalToConstant: 150).isActive = true
        ask_Button.heightAnchor.constraint(equalToConstant: 75).isActive = true
        
        ask_Button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        ask_Button.topAnchor.constraint(equalTo: view.topAnchor, constant: 600).isActive = true
        
        
        
    }

    @objc func buttonPressed() {
        let randomPhrases = phrases.randomElement()
        label_2.text = randomPhrases
    }

}

