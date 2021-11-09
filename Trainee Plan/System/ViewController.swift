//
//  ViewController.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 14.10.2021.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var button21: UIButton = {
        var button = initButton(title: "22. Animation")
        button.addTarget(self, action: #selector(goAnimationScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button22: UIButton = {
        var button = initButton(title: "21. Collection & Table")
        button.addTarget(self, action: #selector(goTableViewScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button151: UIButton = {
        var button = initButton(title: "15.1 URLSession")
        button.addTarget(self, action: #selector(goURLSessionScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button152: UIButton = {
        var button = initButton(title: "15.2 WebSocket")
        button.addTarget(self, action: #selector(goWebSocketScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button18: UIButton = {
        var button = initButton(title: "18 LifeCycle")
        button.addTarget(self, action: #selector(goLifeCycleScreen), for: .touchUpInside)
        return button
    }()
    
    
    lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.contentMode = .top
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple

        view.addSubview(stackView)
        initConstraints()
        fillInStackView()

    }
    
    func fillInStackView() {
        stackView.addArrangedSubview(button151)
        stackView.addArrangedSubview(button152)
        stackView.addArrangedSubview(button18)
        stackView.addArrangedSubview(button21)
        stackView.addArrangedSubview(button22)
        stackView.addArrangedSubview(button22)
        stackView.addArrangedSubview(button22)
        stackView.addArrangedSubview(button22)
    }
        
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    func initButton(title: String) -> UIButton {
        let button = UIButton()
        button.tintColor = .white
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func navigation(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func goAnimationScreen() {
        let aninationScreen = AnimationsVC()
        navigation(vc: aninationScreen)
    }
    
    @objc func goTableViewScreen() {
        let tableViewScreen = CountryVC()
        navigation(vc: tableViewScreen)
    }
    
    @objc func goURLSessionScreen() {
        let urlSessionScreen = URLSessionVC()
        navigation(vc: urlSessionScreen)
    }
    
    @objc func goWebSocketScreen() {
        let webSocketScreen = WebSocketVC()
        navigation(vc: webSocketScreen)
    }
    
    @objc func goLifeCycleScreen() {
        let lifeCycleScreen = LifecycleVC()
        navigation(vc: lifeCycleScreen)
    }

}

