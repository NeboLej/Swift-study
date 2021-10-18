//
//  ViewController.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 14.10.2021.
//

import UIKit

class ViewController: UIViewController {

    var basic = Basics()
    lazy var button = initButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
        // Do any additional setup after loading the view.
        view.addSubview(button)
        initConstraints()
        basic.dataTypes()
        
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     button.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    

    func initButton() -> UIButton {
        let button = UIButton()
        button.tintColor = .white
        button.setTitle("Button 1", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(.none, action: #selector(tapButton), for: .touchDown)
        return button
    }
    
    @objc func tapButton() {
        print("pushViewController_2")
        let newVC = ViewController2()
        newVC.label = "text"
        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
}

