//
//  GameSession.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/04.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

class GameSession {
    
    weak var delegate: GameSessionDelegate?
    
    var questionCount: Int
    var correctAnswers: Int {
        get { return delegate?.scoreChanged(self) ?? 0}
        set { }
    }
    var money: Int {
        return moneyRank[correctAnswers]
    }
    let moneyRank = [0, 10000, 100000, 200000, 500000, 1000000]
    
    init(questionCount: Int){
        self.questionCount = questionCount
    }
}
