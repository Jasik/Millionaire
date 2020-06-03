//
//  Question.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/03.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

struct Question {
    
    let question: String
    let answerOptions: [String]
    let answer: String
    
    init(question: String, answerOptions: [String], answer: String) {
        self.question = question
        self.answerOptions = answerOptions
        self.answer = answer
    }
}
