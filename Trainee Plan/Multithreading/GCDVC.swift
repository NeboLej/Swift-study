import Foundation
import UIKit

class GCDVC: UIViewController {
    
    lazy var button1: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        button.addTarget(self, action: #selector(simpleMethod), for: .touchUpInside)
        button.setTitle("Simple Method", for: .normal)
        return button
    }()
    lazy var button2: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        button.addTarget(self, action: #selector(simpleMethodGlobalQueue), for: .touchUpInside)
        button.setTitle("Simple Method GlobalQueue", for: .normal)
        return button
    }()
    lazy var button3: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        button.addTarget(self, action: #selector(cycle), for: .touchUpInside)
        button.setTitle("Simple Cycle", for: .normal)
        return button
    }()
    lazy var button4: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        button.addTarget(self, action: #selector(multiCycle), for: .touchUpInside)
        button.setTitle("Concurrent Cycle", for: .normal)
        return button
    }()
    lazy var button5: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(displayP3Red: CGFloat.random(in: 0...1 ), green: CGFloat.random(in: 0...1 ), blue: CGFloat.random(in: 0...1 ), alpha: 1)
        return button
    }()
    
    private lazy var langSigmentsControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["1", "2"])
        control.translatesAutoresizingMaskIntoConstraints = false
        control.backgroundColor = .systemBlue
        control.setTitle("Тык", forSegmentAt: 0)
        control.setTitle("Тык", forSegmentAt: 1)
        control.backgroundColor = UIColor(named: "Button")
        return control
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
        view.addSubview(langSigmentsControl)
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
            
            langSigmentsControl.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40.0),
            langSigmentsControl.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            langSigmentsControl.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            langSigmentsControl.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
    
    
    @objc func simpleMethod() {
        print("1 --- Start")
        sleep(5)
        print("1 --- Finish")
    }
    
    @objc func simpleMethodGlobalQueue() {
        DispatchQueue.global().async
        {
            print("1 --- Start")
            sleep(5)
            print("1 --- Finish")
        }
    }
    
    @objc func cycle() {
        for i in 0...500000 {
            print(i)
        }
    }
    
    @objc func multiCycle() {
        let queue = DispatchQueue.global(qos: .utility)
        
        queue.async {
            DispatchQueue.concurrentPerform(iterations: 500000) {
                print("\($0)")
                print(Thread.current)
            }
        }
    }
    
}
