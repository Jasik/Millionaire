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
    
    private init() {}
}
