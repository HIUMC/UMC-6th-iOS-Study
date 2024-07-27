//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 이현주 on 5/12/24.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: Array<String>
    let corretAnswer: String
    
    init(q: String, a: Array<String>, correctAnswer: String) {
        text = q
        answer = a
        self.corretAnswer = correctAnswer
    }
}
