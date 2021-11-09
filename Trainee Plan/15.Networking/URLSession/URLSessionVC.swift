//
//  MyURLSession.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 08.11.2021.
//

import UIKit

class URLSessionVC: UIViewController {
    

    var dataSourse = [DataModel]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(Cell.self, forCellReuseIdentifier: "Cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        //tableView.isHidden = true
        return tableView
    }()
    
    lazy var buttonGet: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("GET", for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(tapGetButton), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonPost: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("POST", for: .normal)
        button.backgroundColor = .systemMint
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(tapPostButton), for: .touchUpInside)
        return button
    }()
    
    let networkManager = NetworkManager()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        initConstraint()
        view.backgroundColor = .white
    }
    
    @objc func tapGetButton() {
        networkManager.getReqest { [weak self] (result) in
            switch result {
            case .success(let data):
                self?.dataSourse = data
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @objc func tapPostButton() {
        networkManager.postReqest(parametrs: ["name" : "ivan", "Message": "Hello"])
    }
    
    func addSubviews() {
        view.addSubview(buttonGet)
        view.addSubview(buttonPost)
        view.addSubview(tableView)
    }
    
    func initConstraint() {
        NSLayoutConstraint.activate([
            buttonGet.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            buttonGet.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            buttonGet.heightAnchor.constraint(equalToConstant: 30),
            buttonGet.widthAnchor.constraint(equalToConstant: 50),
            
            buttonPost.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            buttonPost.leadingAnchor.constraint(equalTo: buttonGet.trailingAnchor, constant: 10),
            buttonPost.heightAnchor.constraint(equalToConstant: 30),
            buttonPost.widthAnchor.constraint(equalToConstant: 50),
            
            tableView.topAnchor.constraint(equalTo: buttonGet.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
       
}

extension URLSessionVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSourse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var conficurationCell = UIListContentConfiguration.cell()
        conficurationCell.text = dataSourse[indexPath.row].title
        conficurationCell.secondaryText = dataSourse[indexPath.row].body
        cell.contentConfiguration = conficurationCell
        return cell
    }
    
    
}
