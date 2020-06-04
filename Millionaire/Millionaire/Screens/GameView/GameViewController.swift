//
//  GameViewController.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/02.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    private var viewModel = QuestionViewModel()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "Correct Answer: 0"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Question"
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let firstAnswerButton: UIButton = {
        let button = CommonButton(text: "A", color: UIColor.btn_blue, radius: 20, textColor: .black)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.border_gray.cgColor
        return button
    }()
    
    private let secondAnswerButton: UIButton = {
        let button = CommonButton(text: "B", color: UIColor.btn_blue, radius: 20, textColor: .black)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.border_gray.cgColor
        return button
    }()
    
    private let thirdAnswerButton: UIButton = {
        let button = CommonButton(text: "C", color: UIColor.btn_blue, radius: 20, textColor: .black)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.border_gray.cgColor
        return button
    }()
    
    private let fourhAnswerButton: UIButton = {
        let button = CommonButton(text: "D", color: UIColor.btn_blue, radius: 20, textColor: .black)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.border_gray.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Game"
        
        self.setTextForInit()
        self.setupViews()
        self.buttonActions()
    }
    
    @objc private func choseAnswer(_ sender: UIButton) {
        
        guard let answer = sender.currentTitle else { return }
        
        let isCorrect = viewModel.checkAnswer(answer)
        
        if isCorrect {
            sender.backgroundColor = .green
            
            viewModel.nextQuestion()
            
            Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { (timer) in
                self.setTextForInit(isReset: true)
            }
        } else {
            sender.backgroundColor = .red
        }
    }
}

private extension GameViewController {
    
    func setupViews() {
        
        view.addSubview(scoreLabel)
        
        scoreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        scoreLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        view.addSubview(questionLabel)
        
        questionLabel.topAnchor.constraint(equalTo: scoreLabel.bottomAnchor, constant: 40).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: scoreLabel.leadingAnchor).isActive = true
        questionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourhAnswerButton])
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: questionLabel.leadingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 40).isActive = true
        stackView.trailingAnchor.constraint(equalTo: questionLabel.trailingAnchor).isActive = true
    }
    
    func setTextForInit(isReset: Bool = false) {
        
        questionLabel.text = viewModel.getQuestion()
        firstAnswerButton.setTitle(viewModel.getAnswerOptionText(for: 0), for: .normal)
        secondAnswerButton.setTitle(viewModel.getAnswerOptionText(for: 1), for: .normal)
        thirdAnswerButton.setTitle(viewModel.getAnswerOptionText(for: 2), for: .normal)
        fourhAnswerButton.setTitle(viewModel.getAnswerOptionText(for: 3), for: .normal)
        
        if isReset {
            firstAnswerButton.backgroundColor = .btn_blue
            secondAnswerButton.backgroundColor = .btn_blue
            thirdAnswerButton.backgroundColor = .btn_blue
            fourhAnswerButton.backgroundColor = .btn_blue
        }
    }
    
    func buttonActions() {
        
        firstAnswerButton.addTarget(self, action: #selector(choseAnswer(_:)), for: .touchUpInside)
        secondAnswerButton.addTarget(self, action: #selector(choseAnswer(_:)), for: .touchUpInside)
        thirdAnswerButton.addTarget(self, action: #selector(choseAnswer(_:)), for: .touchUpInside)
        fourhAnswerButton.addTarget(self, action: #selector(choseAnswer(_:)), for: .touchUpInside)
    }
}
