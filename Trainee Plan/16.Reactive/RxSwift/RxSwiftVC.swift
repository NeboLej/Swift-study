//
//  RxSwiftVC.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 25.11.2021.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa



class RxSwiftVC: UIViewController {
    
    var isIncluded = BehaviorRelay(value: true)
    
    private lazy var button1: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPink
        button.setTitle("Button", for: .normal)
        return button
    }()
    
    private lazy var swith: UISwitch = {
        var swith = UISwitch()
        swith.translatesAutoresizingMaskIntoConstraints = false
        swith.onTintColor = .systemPink
        swith.isOn = true
        swith.addTarget(self, action: #selector(switchEvent), for: .touchUpInside)
        return swith
    }()
    
    @objc func switchEvent(_ sender: UISwitch) {
        isIncluded.accept(sender.isOn)
    }
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstrains()
        
        
        // instance 1
        isIncluded.asObservable().subscribe(onNext: { [weak self] value in
            self?.button1.isEnabled = value
        }).disposed(by: bag)
        
    }
    
    private func addSubviews() {
        view.addSubview(button1)
        view.addSubview(swith)
    }
    
    private func addConstrains() {
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50.0),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
            button1.heightAnchor.constraint(equalToConstant: 30.0),
            button1.widthAnchor.constraint(equalToConstant: 60.0),
            
            swith.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50.0),
            swith.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
            swith.heightAnchor.constraint(equalToConstant: 30.0),
            swith.widthAnchor.constraint(equalToConstant: 60.0)
            
        ])
    }
}
