//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ballImageView: UIImageView!
    @IBAction func askButton(_ sender: Any) {
        let ballArray = [#imageLiteral(resourceName: "ball1.png"), #imageLiteral(resourceName: "ball3"), #imageLiteral(resourceName: "ball3.png"), #imageLiteral(resourceName: "ball4.png"), #imageLiteral(resourceName: "ball5.png")]
        ballImageView.image = ballArray[Int.random(in: 0...4)]
        
        
    }
    



}

