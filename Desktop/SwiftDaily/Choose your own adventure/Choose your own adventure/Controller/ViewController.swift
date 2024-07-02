//
//  ViewController.swift
//  Choose your own adventure
//
//  Created by 이수현 on 6/26/24.
//

import UIKit

class ViewController: UIViewController {

    let choice_1 = UIButton()
    let choice_2 = UIButton()
    let storyTitle = UILabel()
    var stories = AboutStory()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        // MARK: storyTitle label
        storyTitle.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(storyTitle)
        storyTitle.text = stories.stories[stories.selectNum].title
        storyTitle.font = UIFont.systemFont(ofSize: 15)
        storyTitle.textColor = .green
        storyTitle.numberOfLines = 4
        NSLayoutConstraint.activate([
            storyTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            storyTitle.widthAnchor.constraint(equalToConstant: 350),
            storyTitle.heightAnchor.constraint(equalToConstant: 350),
            storyTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
        
        // MARK: choice_1 button
        choice_1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(choice_1)
        choice_1.backgroundColor = .red
        choice_1.layer.cornerRadius = 10
        choice_1.setTitle(stories.stories[stories.selectNum].choice_1, for: .normal)
        choice_1.titleLabel?.numberOfLines = 2
        choice_1.titleLabel?.textAlignment = .center
        choice_1.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        NSLayoutConstraint.activate([
            choice_1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choice_1.widthAnchor.constraint(equalToConstant: 350),
            choice_1.heightAnchor.constraint(equalToConstant: 100),
            choice_1.topAnchor.constraint(equalTo: view.topAnchor, constant: 550)
        ])
        choice_1.addTarget(self, action: #selector(uiUpdate_1), for: .touchUpInside)
        // MARK: choice_2 button
        choice_2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(choice_2)
        choice_2.backgroundColor = .blue
        choice_2.layer.cornerRadius = 10
        choice_2.setTitle(stories.stories[stories.selectNum].choice_2, for: .normal)
        choice_2.titleLabel?.numberOfLines = 2
        choice_2.titleLabel?.textAlignment = .center
        choice_2.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        choice_2.addTarget(self, action: #selector(uiUpdate_2), for: .touchUpInside)
        NSLayoutConstraint.activate([
            choice_2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            choice_2.widthAnchor.constraint(equalToConstant: 350),
            choice_2.heightAnchor.constraint(equalToConstant: 100),
            choice_2.topAnchor.constraint(equalTo: choice_1.bottomAnchor, constant: 30)
        ])
    }

    @objc func uiUpdate_1() {
        storyTitle.text = stories.updateTitle_1()
        choice_1.setTitle(stories.updateChoice_1(), for: .normal)
        choice_2.setTitle(stories.updateChoice_2(), for: .normal)
    }
    
    @objc func uiUpdate_2() {
        storyTitle.text = stories.updateTitle_2()
        choice_1.setTitle(stories.updateChoice_1(), for: .normal)
        choice_2.setTitle(stories.updateChoice_2(), for: .normal)
    }
}

