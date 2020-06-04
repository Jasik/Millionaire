//
//  QuestionViewModel.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/03.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import Foundation

protocol Questions {
    
    var questions: [Question] { get }
    var questionNum: Int { get set }
    var score: Int { get set }
    
    mutating func checkAnswer(_ answer: String) -> Bool
    func getQuestion() -> String
    func getAnswerOptionText(for index: Int) -> String
    mutating func nextQuestion()
    func getMoneyCount(from score: Int) -> Int
}

struct QuestionViewModel: Questions {

    var questions: [Question] = [
        Question(
            question: "Какой газ преобладает в атмосфере Земли?",
            answerOptions: ["Кислород", "Азот", "Углекислый газ", "Водород"],
            answer: "Азот"),
        Question(
            question: "Какой вид спорта не входит в современное пятиборье?",
            answerOptions: ["Метание копья", "Верховая езда", "Фехтование", "Плавание"],
            answer: "Метание копья"),
        Question(
            question: "Как иначе называют пиратский флаг?",
            answerOptions: ["Весёлый Роджер", "Грязный Гарри", "Бедный Йорик", "Лимонадный Джо"],
            answer: "Весёлый Роджер"),
        Question(
            question: "Как называется популярный рецепт приготовления макарон с мясом?",
            answerOptions: ["По-деревенски", "По-флотски", "По-братски", "По-божески"],
            answer: "По-флотски"),
        Question(
            question: "Какое государство ежегодно дарит Лондону ёлку для Трафальгарской площади?",
            answerOptions: ["Дания", "Норвегия", "Швеция", "Эстония"],
            answer: "Норвегия")
    ]
    
    var questionNum: Int = 0
    var score: Int = 0
    
    mutating func checkAnswer(_ answer: String) -> Bool {
        if questions[questionNum].answer == answer {
            score += 1
            
            return true
        } else {
            return false
        }
    }
    
    func getQuestion() -> String {
        questions[questionNum].question
    }
    
    func getAnswerOptionText(for index: Int) -> String {
        questions[questionNum].answerOptions[index]
    }
    
    mutating func nextQuestion() {
        if questionNum + 1 < questions.count {
            questionNum += 1
        } else {
            questionNum = 0
        }
    }
    
    func getMoneyCount(from score: Int) -> Int {
        switch score {
        case 0:
            return 0
        case 1:
            return 10000
        case 2:
            return 100000
        case 3:
            return 200000
        case 4:
            return 500000
        case 5:
            return 1000000
        default:
            return 0
        }
    }
}
