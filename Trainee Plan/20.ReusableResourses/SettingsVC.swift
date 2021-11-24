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
        label.textColor = UIColor(named: "Label")
        return label
    }()
    
    lazy var langLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("settingsVC_langLabel", tableName: "Localization", bundle: .main, value: "___", comment: "")
        label.textAlignment = .left
        label.textColor = UIColor(named: "Label")
        return label
    }()
    
    private lazy var langSigmentsControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["1", "2"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .systemBlue
        control.setTitle(NSLocalizedString("settingsVC_English", tableName: "Localization", bundle: .main, value: "___", comment: ""), forSegmentAt: 0)
        control.setTitle(NSLocalizedString("settingsVC_Russian", tableName: "Localization", bundle: .main, value: "___", comment: ""), forSegmentAt: 1)
        control.addTarget(self, action: #selector(controlTap), for: .allEvents)
        control.backgroundColor = UIColor(named: "Button")
        return control
    }()
    
    lazy var themeLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = NSLocalizedString("settingsVC_Theme", tableName: "Localization", bundle: .main, value: "___", comment: "")
        label.textAlignment = .center
        label.textColor = UIColor(named: "Label")
        return label
    }()
    
    private lazy var themeSigmentsControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["1", "2", "3", "4"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .systemBlue
        control.setTitle(NSLocalizedString("settingsVC_Day", tableName: "Localization", bundle: .main, value: "___", comment: ""), forSegmentAt: 0)
        control.setTitle(NSLocalizedString("settingsVC_Night", tableName: "Localization", bundle: .main, value: "___", comment: ""), forSegmentAt: 1)
        control.setTitle(NSLocalizedString("settingsVC_AcidGreen", tableName: "Localization", bundle: .main, value: "___", comment: ""), forSegmentAt: 2)
        control.setTitle(NSLocalizedString("settingsVC_PainEyes", tableName: "Localization", bundle: .main, value: "___", comment: ""), forSegmentAt: 3)
        control.addTarget(self, action: #selector(controlThemeTap), for: .allEvents)
        control.backgroundColor = UIColor(named: "Button")
        return control
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")
        addSubviews()
        initConstraints()
        
        let index = UserDefaults.standard.integer(forKey: "indexTheme")
        themeSigmentsControl.selectedSegmentIndex = index
        changeTheme()
    }
    
    private func addSubviews() {
        view.addSubview(label)
        view.addSubview(langLabel)
        view.addSubview(langSigmentsControl)
        view.addSubview(themeLabel)
        view.addSubview(themeSigmentsControl)
    }
    
    @objc func controlThemeTap() {
        changeTheme()
    }
    
    private func changeTheme() {
        let indexTheme = themeSigmentsControl.selectedSegmentIndex
        switch indexTheme {
        case 0: overrideUserInterfaceStyle = .light
            langSigmentsControl.backgroundColor = UIColor(named: "Button")
            themeSigmentsControl.backgroundColor = UIColor(named: "Button")
            view.backgroundColor = UIColor(named: "Background")
            
        case 1: overrideUserInterfaceStyle = .dark
            langSigmentsControl.backgroundColor = UIColor(named: "Button")
            themeSigmentsControl.backgroundColor = UIColor(named: "Button")
            view.backgroundColor = UIColor(named: "Background")
        case 2:
            overrideUserInterfaceStyle = .light
            var customTheme = CustomTheme()
            customTheme.getTheme(theme: .acidGreen)
            view.backgroundColor = customTheme.backgroungColor
            themeSigmentsControl.backgroundColor = customTheme.buttonColor
            langSigmentsControl.backgroundColor = customTheme.buttonColor
            label.textColor = customTheme.labelColor
            themeLabel.textColor = customTheme.labelColor
        case 3:
            overrideUserInterfaceStyle = .light
            var customTheme = CustomTheme()
            customTheme.getTheme(theme: .painEyes)
            view.backgroundColor = customTheme.backgroungColor
            themeSigmentsControl.backgroundColor = customTheme.buttonColor
            langSigmentsControl.backgroundColor = customTheme.buttonColor
            label.textColor = customTheme.labelColor
            themeLabel.textColor = customTheme.labelColor
        default: break
        }
        UserDefaults.standard.set(indexTheme, forKey: "indexTheme")
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
            langSigmentsControl.heightAnchor.constraint(equalToConstant: 30.0),
            
            themeLabel.topAnchor.constraint(equalTo: langSigmentsControl.bottomAnchor, constant: 40.0),
            themeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            themeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            themeLabel.heightAnchor.constraint(equalToConstant: 30.0),
            
            themeSigmentsControl.topAnchor.constraint(equalTo: themeLabel.bottomAnchor, constant: 20.0),
            themeSigmentsControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            themeSigmentsControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            themeSigmentsControl.heightAnchor.constraint(equalToConstant: 40.0)
                
        ])
    }
}
