//
//  ResultViewController.swift
//  Millionaire
//
//  Created by Vladimir Rogozhkin on 2020/06/02.
//  Copyright © 2020 Vladimir Rogozhkin. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    private let tableView = UITableView()
    
    var results: [Result]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    init(results: [Result]) {
        
        self.results = results
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "Results"
        
        self.setupView()
    }
}

private extension ResultViewController {
    
    func setupView() {
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ResultViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let resultsCount = results?.count else { return 0 }
        return resultsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        guard let result = results?[indexPath.row] else { return cell }
        
        cell.textLabel?.text = "\(result.date.getFormattedDate()) : \(result.prize)"
        
        return cell
    }
}

extension ResultViewController: UITableViewDelegate {
    
}
