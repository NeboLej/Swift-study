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
    var count = 0
    
    lazy var button1: UIButton = {
        var button = initButton(label: "Button1")
        button.addTarget(self, action: #selector(tapButton1), for: .touchUpInside)
        return button
    }()
    
    lazy var button2: UIButton = {
        var button = initButton(label: "Button2")
        button.addTarget(self, action: #selector(tapButton2), for: .touchUpInside)
        return button
    }()
    
    lazy var button3: UIButton = {
        var button = initButton(label: "Button3")
        button.addTarget(self, action: #selector(tapButton3), for: .touchUpInside)
        return button
    }()
    
    lazy var button4: UIButton = {
        var button = initButton(label: "Button4")
        button.addTarget(self, action: #selector(tapButton4), for: .touchUpInside)
        return button
    }()
    
    func initButton(label: String)->UIButton {
        let button = UIButton(type: .system)
        button.setTitle(label, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        addSubviews()
        initConstraint()
    }
    
    func addSubviews(){
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
    }
    
    
    func initConstraint() {
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            button1.heightAnchor.constraint(equalToConstant: 30),
            button1.widthAnchor.constraint(equalToConstant: 80),
            
            button2.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button2.leadingAnchor.constraint(equalTo: button1.trailingAnchor, constant: 10),
            button2.heightAnchor.constraint(equalToConstant: 30),
            button2.widthAnchor.constraint(equalToConstant: 80),
            
            button3.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button3.leadingAnchor.constraint(equalTo: button2.trailingAnchor, constant: 10),
            button3.heightAnchor.constraint(equalToConstant: 30),
            button3.widthAnchor.constraint(equalToConstant: 80),
            
            button4.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            button4.leadingAnchor.constraint(equalTo: button3.trailingAnchor, constant: 10),
            button4.heightAnchor.constraint(equalToConstant: 30),
            button4.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    @objc func tapButton1(){
        let view = initCurrentView1()
        self.view.addSubview(view)
        initCurrentViewConstraints(view: view, width: 30, heigh: 30)
        animation1(animatedView: view)
    }
    
    @objc func tapButton2(){
        let view = initCurrentView2()
        self.view.addSubview(view)
        initCurrentViewConstraints(view: view, width: 40, heigh: 40)
        animation2(animatedView: view)
    }
    
    @objc func tapButton3(){
        let view = initCurrentView3()
        self.view.addSubview(view)
        initCurrentViewConstraints2(view: view, width: 40, heigh: 40)
        animation3(animatedView: view)
    }
    
    @objc func tapButton4(){
        let view = initCurrentView4()
        self.view.addSubview(view)
        animation4(animatedView: view)
    }
    
    
    func initCurrentView1()->UIView {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 15
        return view
    }
    
    func initCurrentView2()->UIView {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        let internalView = UIView()
        internalView.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        internalView.center = view.center
        internalView.frame = CGRect(x: view.frame.minX+10, y: view.frame.minY+15, width: 20, height: 10)
        view.addSubview(internalView)
        return view
    }
    
    func initCurrentView3()->UIView {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 20
        let internalView = UIView()
        internalView.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        internalView.center = view.center
        internalView.frame = CGRect(x: view.frame.minX+10, y: view.frame.minY+18, width: 20, height: 3)
        let internalView2 = UIView()
        
        internalView2.backgroundColor = internalView.backgroundColor
        internalView2.center = view.center
        internalView2.frame = CGRect(x: view.frame.minX+18, y: view.frame.minY+10, width: 3, height: 20)
        
        view.addSubview(internalView)
        view.addSubview(internalView2)
        return view
    }
    
    func initCurrentView4()->UIView {
        let view = UIView()
        view.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        let randomSize = CGFloat.random(in: 30...50)
        view.frame = CGRect(x: CGFloat.random(in: 10...self.view.bounds.width-10), y: 150, width: randomSize, height: randomSize)
        view.layer.cornerRadius = randomSize/2
        let label = UILabel()
        count += 1
        label.text = String(count)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        return view
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
    
    func animation2(animatedView: UIView) {
        UIView.animate(withDuration: CGFloat.random(in: 0.5...2.0), animations: {
            animatedView.transform = CGAffineTransform(translationX: 0, y: 500).scaledBy(x: 1.5, y: 1.5)
            animatedView.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        }, completion: { _ in
            UIView.animate(withDuration: 1, animations: {
                animatedView.alpha = 0.6
            })
        })
    }
    
    func animation3(animatedView: UIView) {
        UIView.animate(withDuration: 1.0, animations: {
            animatedView.frame.origin.y = self.view.bounds.minY+400
        }, completion: {
            _ in
            UIView.animateKeyframes(withDuration: CGFloat.random(in: 0.5...2.0), delay: 1.0, options: [.repeat, .autoreverse], animations: {
                animatedView.frame.origin.x = self.view.bounds.width
                animatedView.transform = CGAffineTransform(rotationAngle: .pi)
            }, completion: { _ in
                
            })
        })
    }
    
    func animation4(animatedView: UIView) {
        UIView.animateKeyframes(withDuration: CGFloat.random(in: 3...4.0), delay: 0.1, options: [.repeat, .autoreverse], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.05, animations: {
                animatedView.frame.origin.y += 350
                animatedView.transform = .init(scaleX: 0.9, y: 1.1)
            })
            UIView.addKeyframe(withRelativeStartTime: 0.05, relativeDuration: 0.01, animations: {
                animatedView.transform = .init(scaleX: 1.5, y: 0.5)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.06, relativeDuration: 0.02, animations: {
                animatedView.transform = .init(scaleX: 1, y: 1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.08, relativeDuration: 0.1, animations: {
                animatedView.frame.origin.y -= 200
                animatedView.transform = .init(scaleX: 0.9, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.18, relativeDuration: 0.001, animations: {
                animatedView.transform = .init(scaleX: 1, y: 1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.181, relativeDuration: 0.2, animations: {
                animatedView.frame.origin.y += 200
                animatedView.transform = .init(scaleX: 0.9, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.381, relativeDuration: 0.01, animations: {
                animatedView.transform = .init(scaleX: 1.5, y: 0.5)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.391, relativeDuration: 0.01, animations: {
                animatedView.transform = .init(scaleX: 1, y: 1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.401, relativeDuration: 0.20, animations: {
                animatedView.frame.origin.y -= 100
                animatedView.transform = .init(scaleX: 0.9, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.601, relativeDuration: 0.001, animations: {
                animatedView.transform = .init(scaleX: 1, y: 1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.602, relativeDuration: 0.2, animations: {
                animatedView.frame.origin.y += 100
                animatedView.transform = .init(scaleX: 0.9, y: 1.1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.802, relativeDuration: 0.01, animations: {
                animatedView.transform = .init(scaleX: 1.5, y: 0.5)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.812, relativeDuration: 0.01, animations: {
                animatedView.transform = .init(scaleX: 1, y: 1)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.822, relativeDuration: 0.178, animations: {
                animatedView.frame.origin.y -= 50
                animatedView.transform = .init(scaleX: 0.95, y: 1.05)
            })
    
        }, completion: { _ in
            
        })
    }
    

    func initCurrentViewConstraints(view: UIView, width: CGFloat, heigh: CGFloat){
            
        topConstraint = view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 70)
        topConstraint.isActive = true
        
        bottomConstraint = view.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        bottomConstraint.isActive = false

        NSLayoutConstraint.activate([

            view.widthAnchor.constraint(equalToConstant: width),
            view.heightAnchor.constraint(equalToConstant: heigh),
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: CGFloat.random(in: 10...self.view.bounds.width-10 ))
        ])
    }
    
    func initCurrentViewConstraints2(view: UIView, width: CGFloat, heigh: CGFloat){

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 470),
            view.widthAnchor.constraint(equalToConstant: width),
            view.heightAnchor.constraint(equalToConstant: heigh),
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: CGFloat.random(in: 10...self.view.bounds.width-10 ))
        ])
    }
    
    func initCurrentViewConstraints3(view: UIView, width: CGFloat, heigh: CGFloat){

        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 370),
            view.widthAnchor.constraint(equalToConstant: width),
            view.heightAnchor.constraint(equalToConstant: heigh),
            view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: CGFloat.random(in: 10...self.view.bounds.width-10 ))
        ])
    }
    
    
    
}
