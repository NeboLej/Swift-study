//
//  ViewController.swift
//  ProjectTESTS
//
//  Created by Anton Pakhomov on 17.11.2021.
//

import UIKit

class UnderTests: UIViewController {

    lazy var button: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("button", for: .normal)
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(tapButton), for: .touchUpInside)
        //идентификатор для uI тестов
        button.accessibilityIdentifier = "Button1"
        return button
    }()
    
    lazy var textField: UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray
        textField.tintColor = .systemPink
        //идентификатор для uI тестов
        textField.accessibilityIdentifier = "TextField1"
        return textField
    }()
    
    @objc func tapButton() {
        if textField.text == "wtf" {
            button.isEnabled = false
        } else {
            textField.text = "Hello!"
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(button)
        view.addSubview(textField)
        
        initConstraints()
        //post()
    }
    
    
    // 1. обычный тест
    func myltiply(a: Int, b: Int) -> Int {
        return a*b
    }
    
    // 2. часть кейсов протестирована
    func halfWeek(number: Int) -> String {
        var result = ""
        switch number {
        case 1:
          result = "понедельник"
        case 2:
            result = "вторник"
        case 3:
            result = "среда"
        default:
            result = "Ошибка!"
        }
        return result
    }
    
    
    // 3. Тестирование асинхронного метода
    
    func asyncValidateLoginTextFields(loginTF: UITextField, passwordTF: UITextField, completion: @escaping (Bool)->(Void)) { 
        
        DispatchQueue.global(qos: .background).asyncAfter(deadline: .now()+1.5, execute: {
                
                DispatchQueue.main.async {
                    let result = loginTF.hasText && passwordTF.hasText && passwordTF.text == "12345"
                    
                    completion(result)
                }
        })
        
    }
    
    func post() {
        let networkManager = Networking()

        let handler: (DataModel)->Void = { data in print("--------1-------\(data.title)")}
        networkManager.getReqest(completion: handler)
    }
    
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50.0),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 40.0),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 40),
            
            
            
            
        ])

    }

}

