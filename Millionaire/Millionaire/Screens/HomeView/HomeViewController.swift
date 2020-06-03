//
//  HomeViewController.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/02.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let resultButton: UIButton = {
        let button = CommonButton(text: "Show Result", color: UIColor.btn_blue)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.border_gray.cgColor
        return button
    }()
    
    private let gameButton: UIButton = {
        let button = CommonButton(text: "Play", color: UIColor.btn_blue)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .bold)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.border_gray.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Millionaire Game"
        
        setupViews()
        
        resultButton.addTarget(self, action: #selector(handleShowResult), for: .touchUpInside)
        gameButton.addTarget(self, action: #selector(handlePlay), for: .touchUpInside)
    }
    
    private func setupViews() {
        let stackView = UIStackView(arrangedSubviews: [gameButton, resultButton])
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
    
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc private func handleShowResult() {
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(ResultViewController(), animated: true)
    }
    
    @objc private func handlePlay() {
        guard let navigationController = navigationController else { return }
        navigationController.pushViewController(GameViewController(), animated: true)
    }
    
}
