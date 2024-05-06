//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    let eggTimes = ["Soft": 3, "Medium": 420, "Hard": 720]
    // 딕셔너리
    var total = 0
    var secondPassed = 0
    var timer = Timer()
    @IBOutlet weak var eggLabel: UILabel!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        total = eggTimes[hardness]!
        
        progressBar.progress = 0.0
        secondPassed = 0
        eggLabel.text = hardness
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        if secondPassed < total {
            secondPassed += 1
            let percentageProgress = Float(secondPassed) / Float(total)
            progressBar.progress = Float(percentageProgress)
        } else {
            timer.invalidate()
            eggLabel.text = "Done"
            playSound()
        }
    }
    
    var player: AVAudioPlayer?

    func playSound() {
        guard let path = Bundle.main.path(forResource: "alarm_sound", ofType:"mp3") else {
            return }
        let url = URL(fileURLWithPath: path)

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
