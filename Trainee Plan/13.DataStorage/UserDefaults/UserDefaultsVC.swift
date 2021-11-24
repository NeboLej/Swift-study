//
//  UserDefaultsVC.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 23.11.2021.
//

import Foundation
import UIKit

class UserDefaultsVC: UIViewController {
    
    var userDM = UserDefaultsManager()
    
    private lazy var sigmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["male", "female"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .systemBlue
        control.selectedSegmentIndex = 0
        
        return control
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemBlue
        textField.placeholder = "Username"
        textField.tintColor = .systemPink
        textField.layer.cornerRadius = 10
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        return textField
    }()
    
    private lazy var ageTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemBlue
        textField.placeholder = "Age"
        textField.tintColor = .systemPink
        textField.layer.cornerRadius = 10
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        return textField
    }()
    
    
    private lazy var saveButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.layer.borderColor = .init(red: 102, green: 20, blue: 12, alpha: 1)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 40
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(saveUserTap), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        
        addSubviews()
        initConstraints()
        getUser()
    }
    
    private func getUser() {
        let user = userDM.getUser()
        nameTextField.text = user.name
        ageTextField.text = user.age
        
        if user.sex == SexType.male.rawValue {
            sigmentedControl.selectedSegmentIndex = 0
        } else {
            sigmentedControl.selectedSegmentIndex = 1
        }
    }

    @objc func saveUserTap() {
        let name = nameTextField.text!
        let age = ageTextField.text!
        var sex = ""
        if sigmentedControl.selectedSegmentIndex == 0 {
            sex = SexType.male.rawValue
        } else {
            sex = SexType.female.rawValue
        }
        
        if !name.isEmpty && !age.isEmpty {
            userDM.saveUser(name: name, age: age, sex: sex)
        }     
    }
    
    
    private func addSubviews() {
        view.addSubview(sigmentedControl)
        view.addSubview(nameTextField)
        view.addSubview(ageTextField)
        view.addSubview(saveButton)
    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([

            nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100.0),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            nameTextField.heightAnchor.constraint(equalToConstant: 50.0),
            
            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20.0),
            ageTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            ageTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            ageTextField.heightAnchor.constraint(equalToConstant: 50.0),
            
            sigmentedControl.topAnchor.constraint(equalTo: ageTextField.bottomAnchor, constant: 40.0),
            sigmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            sigmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            sigmentedControl.heightAnchor.constraint(equalToConstant: 50.0),
            
            saveButton.topAnchor.constraint(equalTo: sigmentedControl.bottomAnchor, constant: 100),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.heightAnchor.constraint(equalToConstant: 80),
            saveButton.widthAnchor.constraint(equalToConstant: 80),
        ])
    }
    
}
