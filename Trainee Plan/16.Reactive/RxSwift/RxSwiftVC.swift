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
    
    var isIncluded = BehaviorRelay(value: false)
    var generalText = PublishSubject<String>()
    var time = PublishSubject<Int>()
    var test = ReplaySubject<String>.create(bufferSize: 3)
    
    
    private lazy var button1: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPink
        button.setTitle("Time", for: .normal)
        button.addTarget(self, action: #selector(stopwatch), for: .touchUpInside)
        return button
    }()
    
    private lazy var swith: UISwitch = {
        var swith = UISwitch()
        swith.translatesAutoresizingMaskIntoConstraints = false
        swith.onTintColor = .systemPink
        //swith.isOn = true
        swith.addTarget(self, action: #selector(switchEvent), for: .touchUpInside)
        return swith
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemBlue
        textField.placeholder = "text"
        textField.tintColor = .systemPink
        textField.layer.cornerRadius = 10
        let spacerView = UIView(frame:CGRect(x:0, y:0, width:10, height:10))
        textField.leftViewMode = .always
        textField.leftView = spacerView
        return textField
    }()
    
    
    private lazy var setButton: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Set", for: .normal)
        button.layer.borderColor = .init(red: 102, green: 20, blue: 12, alpha: 1)
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 35
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(saveUserTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var labelTime: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "0"
        label.textColor = .systemPink
        label.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 60.0)
        
         //instance 3
        time.subscribe { event in
            label.text = String(event)
        }.disposed(by: bag)

        
        // instance 4
//        time.filter { event in
//            event % 2 == 0
//        }.subscribe { event in
//            label.text = String(event)
//        }
        return label
    }()
    
    @objc func saveUserTap() {
        generalText.onNext(textField.text!)
    }
    
    @objc func switchEvent(_ sender: UISwitch) {
        isIncluded.accept(sender.isOn)
    }
    
    let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addConstrains()
        addManylabels()
        
        // instance 1
        isIncluded.asObservable().subscribe(onNext: { [weak self] value in
            self?.button1.isEnabled = value
            self?.textField.isEnabled = value
        }).disposed(by: bag)
        
        

    }
    
    // instance 2
    func addManylabels() {
        for i in 0...10 {
            let label = UILabel(frame: CGRect(x: 10+(i*40), y: 340, width: 100, height: 20))
            label.textColor = .white
            label.text = "hi"
            generalText.subscribe { string in
                label.text = string
            } onError: { error in
                label.text = "Error"
            }.disposed(by: bag)
            view.addSubview(label)

        }
    }
    
    @objc func stopwatch() {
        for i in 1...60 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.time.onNext(i)
                print(i)
            }
        }
    }
    
    private func addSubviews() {
        view.addSubview(button1)
        view.addSubview(swith)
        view.addSubview(textField)
        view.addSubview(setButton)
        view.addSubview(labelTime)
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
            swith.widthAnchor.constraint(equalToConstant: 60.0),
            
            textField.topAnchor.constraint(equalTo: swith.bottomAnchor, constant: 30.0),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10.0),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10.0),
            textField.heightAnchor.constraint(equalToConstant: 30.0),
            
            setButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 30.0),
            setButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            setButton.heightAnchor.constraint(equalToConstant: 70.0),
            setButton.widthAnchor.constraint(equalToConstant: 70.0),
            
            labelTime.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelTime.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
            
        ])
    }
}
