//
//  ViewController2.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 18.10.2021.
//

import UIKit

class ViewController2: UIViewController {
    
    lazy var button = initButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(button)
        initConstraints()
        
        
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
        print("pushViewController_1")
        let newVC = ViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
    
}
