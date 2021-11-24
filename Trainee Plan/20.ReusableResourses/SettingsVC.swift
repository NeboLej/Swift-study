//
//  SettingVC.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 24.11.2021.
//

import Foundation
import UIKit

class SettingsVC: UIViewController {
    
    lazy var label: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("settingsVC_label", tableName: "Localization", bundle: .main, value: "___", comment: "")
        label.textAlignment = .center
        return label
    }()
    
    lazy var langLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("settingsVC_langLabel", tableName: "Localization", bundle: .main, value: "___", comment: "")
        label.textAlignment = .left
        return label
    }()
    
    private lazy var langSigmentsControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["1", "2"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .systemBlue
        control.setTitle(NSLocalizedString("settingsVC_English", tableName: "Localization", bundle: .main, value: "___", comment: ""), forSegmentAt: 0)
        control.setTitle(NSLocalizedString("settingsVC_Russian", tableName: "Localization", bundle: .main, value: "___", comment: ""), forSegmentAt: 1)
        control.addTarget(self, action: #selector(controlTap), for: .allEvents)
        return control
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        initConstraints()
        changeLanguage()
    }
    
    private func addSubviews() {
        view.addSubview(label)
        view.addSubview(langLabel)
        view.addSubview(langSigmentsControl)
    }
    
    @objc func controlTap() {
        changeLanguage()
    }
    
    private func changeLanguage() {
        let sigmentPosition = langSigmentsControl.selectedSegmentIndex
        var language = "English"
        switch sigmentPosition {
        case 0: language = "English"
        case 1: language = "Russian"
        default : break
        }
        print(language)
        UserDefaults.standard.set([language], forKey: "AppleLanguages")
        UserDefaults.standard.synchronize()

    }
    
    private func initConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            label.heightAnchor.constraint(equalToConstant: 50.0),
            
            langLabel.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 80.0),
            langLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            langLabel.widthAnchor.constraint(equalToConstant: 200.0),
            langLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            langSigmentsControl.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 80.0),
            langSigmentsControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            langSigmentsControl.widthAnchor.constraint(equalToConstant: 200.0),
            langSigmentsControl.heightAnchor.constraint(equalToConstant: 30.0)
                
        ])
    }
}
