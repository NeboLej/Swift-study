import Foundation
import UIKit

class GCDVC: ViewController {
    
    lazy var button1: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        return button
    }()
    lazy var button2: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        return button
    }()
    lazy var button3: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        return button
    }()
    lazy var button4: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        return button
    }()
    lazy var button5: UIButton = {
        var button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        addSubviews()
        addConstraints()
        
    }
    
    
    private func addSubviews() {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        view.addSubview(button5)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10.0),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button1.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button1.heightAnchor.constraint(equalToConstant: 30),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 10.0),
            button2.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button2.heightAnchor.constraint(equalToConstant: 30),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 10.0),
            button3.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button3.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button3.heightAnchor.constraint(equalToConstant: 30),
            
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 10.0),
            button4.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button4.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button4.heightAnchor.constraint(equalToConstant: 30),
            
            button5.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 10.0),
            button5.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button5.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button5.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
}
