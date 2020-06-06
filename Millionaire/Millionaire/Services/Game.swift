//
//  Game.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/04.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    private var gameSession: GameSession?
    private let recordsCaretaker = RecordCaretaker()
    
    private(set) var results: [Result] {
        didSet {
            recordsCaretaker.save(records: self.results)
        }
    }
    
    func start(_ gameSession: GameSession) {
        self.gameSession = gameSession
    }
    
    func finish() {
        guard let gameSession = self.gameSession else { return }
        let result = Result(date: Date(), prize: gameSession.money)
        results.append(result)
        self.gameSession = nil
    }
    
    private init() {
        self.results = self.recordsCaretaker.retrieveRecords()
    }
}
