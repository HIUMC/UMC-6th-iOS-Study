//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player : AVAudioPlayer?
    

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(keyname : sender.currentTitle ?? "")
        sender.alpha = 0.5
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            
            sender.alpha = 1.0
        }
    }
    
    func playSound(keyname : String) {
        guard let path = Bundle.main.path(forResource: keyname, ofType:"wav") else {
            return }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    

}

