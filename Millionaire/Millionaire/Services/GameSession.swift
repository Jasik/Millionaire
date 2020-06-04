//
//  GameSession.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/04.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

class GameSession {
    
    var questionCount: Int
    var correctAnswers: Int
    var money: Int
    
    init(questionCount: Int, correctAnswers: Int, money: Int) {
        self.questionCount = questionCount
        self.correctAnswers = correctAnswers
        self.money = money
    }
}
