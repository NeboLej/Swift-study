//
//  DataStorageVC.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 22.11.2021.
//

import Foundation
import UIKit

class DataStorageVC: UIViewController {
    
    var coreDataManager = CoreDataManager()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 3
        textField.layer.borderWidth = 2
        textField.layer.borderColor = .init(red: 102, green: 20, blue: 12, alpha: 1)
        textField.placeholder = "User name"
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
    
    private lazy var getButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Get", for: .normal)
        button.layer.borderColor = .init(red: 102, green: 20, blue: 12, alpha: 1)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 40
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(getUsersTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var deleteButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Delete", for: .normal)
        button.layer.borderColor = .init(red: 102, green: 20, blue: 12, alpha: 1)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 40
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(deleteUserTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var userslabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        view.addSubview(nameTextField)
        view.addSubview(saveButton)
        view.addSubview(getButton)
        view.addSubview(deleteButton)
        view.addSubview(userslabel)
        initConstraints()
    }
    
    
    func saveUser() {
        let user = UserModel(context: coreDataManager.viewContext)
        user.name = nameTextField.text
        coreDataManager.addUser(user: user)
    }
    
    func deleteUsers() {
        let user = UserModel(context: coreDataManager.viewContext)
        user.name = nameTextField.text
        coreDataManager.deleteUsers(user: user)
    }
    
    @objc func deleteUserTap() {
        deleteUsers()
        getUsers()
    }
    
    @objc func saveUserTap() {
        saveUser()
        getUsers()
    }
    
    @objc func getUsersTap() {
        getUsers()
    }
    
    private func getUsers() {
        let users = coreDataManager.getAllUsers()
        
        userslabel.text = ""
        for user in users {
            userslabel.text! += ((user.name ?? "-") + " ")
        }
    }

    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            saveButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 160),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 120),
            saveButton.heightAnchor.constraint(equalToConstant: 80),
            saveButton.widthAnchor.constraint(equalToConstant: 80),
            
            getButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 160),
            getButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -120),
            getButton.heightAnchor.constraint(equalToConstant: 80),
            getButton.widthAnchor.constraint(equalToConstant: 80),
            
            deleteButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 160),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteButton.heightAnchor.constraint(equalToConstant: 80),
            deleteButton.widthAnchor.constraint(equalToConstant: 80),
            
            userslabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userslabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            userslabel.topAnchor.constraint(equalTo: getButton.bottomAnchor, constant: 30),
            userslabel.heightAnchor.constraint(equalToConstant: 80)
            
        ])
    }
    
    
}
