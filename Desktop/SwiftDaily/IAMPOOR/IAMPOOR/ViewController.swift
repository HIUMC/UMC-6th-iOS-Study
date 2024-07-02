//
//  ViewController.swift
//  IAMPOOR
//
//  Created by 이수현 on 6/26/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "I am poor"
        label.textAlignment = .center
        label.textColor = .green
        
        
        view.addSubview(label)
        label.widthAnchor.constraint(equalToConstant: 200).isActive = true
        label.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        
        let mycoal = UIImageView()
        
        mycoal.translatesAutoresizingMaskIntoConstraints = false
        mycoal.image = UIImage(named: "coal")
        mycoal.contentMode = .scaleAspectFill
        
        view.addSubview(mycoal)
        
        mycoal.widthAnchor.constraint(equalToConstant: 300).isActive = true
        mycoal.heightAnchor.constraint(equalToConstant: 300).isActive = true
        mycoal.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mycoal.topAnchor.constraint(equalTo: view.topAnchor, constant: 350).isActive = true
            
    }


}

