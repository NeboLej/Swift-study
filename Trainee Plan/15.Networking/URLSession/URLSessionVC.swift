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
        return tableView
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //getReqest()
        
        addSubviews()
        initConstraint()
    }
    
    func addSubviews() {
        view.addSubview(tableView)
    }
    
    func initConstraint() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
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
