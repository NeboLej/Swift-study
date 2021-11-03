//
//  AnimationsVC.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 03.11.2021.
//

import UIKit
class AnimationsVC: UIViewController {
    
    var topConstraint: NSLayoutConstraint!
    var bottomConstraint: NSLayoutConstraint!
    var centerYConstraint: NSLayoutConstraint!
    
    lazy var button1: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Button1", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButton1), for: .touchUpInside)
        return button
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        addSubviews()
        initConstraint()
    }
    
    func addSubviews(){
        view.addSubview(button1)
    }
    
    
    func initConstraint() {
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            button1.heightAnchor.constraint(equalToConstant: 30),
            button1.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func tapButton1(){
        let view = initCurrentView1()
        self.view.addSubview(view)
        initCurrentViewConstraints(view: view)
        animation1(animatedView: view)
    }
    
    @objc func tapButton2(){
        let view1 = initCurrentView1()
        self.view.addSubview(view1)
        initCurrentViewConstraints(view: view1)
        animation1(animatedView: view1)
    }
    
    
    func animation1(animatedView: UIView) {
        UIView.animate(withDuration: CGFloat.random(in: 0.5...2.0)) {
            //если на констреинтах то так
//            self.topConstraint.isActive = false
//            self.bottomConstraint.isActive = true
//            self.view.layoutIfNeeded()
            
            animatedView.transform = .init(translationX: 0, y: 600)
        }
    }
    
    func initCurrentView1()->UIView {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }
    
    func initCurrentViewConstraints(view: UIView){
            
        topConstraint = view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 70)
        topConstraint.isActive = true
        
        bottomConstraint = view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        bottomConstraint.isActive = false

        NSLayoutConstraint.activate([

            view.widthAnchor.constraint(equalToConstant: 30),
            view.heightAnchor.constraint(equalToConstant: 30),
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: CGFloat.random(in: 10...self.view.bounds.width-10 ))
        ])
        

    }
    
    
    
}
