import Foundation
import UIKit

class GCDVC: UIViewController {
    
    lazy var button1: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(simpleMethod), for: .touchUpInside)
        button.setTitle("Simple Method", for: .normal)
        return button
    }()
    lazy var button2: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(simpleMethodGlobalQueue), for: .touchUpInside)
        button.setTitle("Simple Method GlobalQueue", for: .normal)
        return button
    }()
    lazy var button3: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(cycle), for: .touchUpInside)
        button.setTitle("Simple Cycle", for: .normal)
        return button
    }()
    lazy var button4: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(multiCycle), for: .touchUpInside)
        button.setTitle("Concurrent Cycle", for: .normal)
        return button
    }()
    lazy var button5: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(delayedLaunch), for: .touchUpInside)
        button.setTitle("delayed Launch", for: .normal)
        return button
    }()
    
    lazy var button6: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(inactiveQueue), for: .touchUpInside)
        button.setTitle("inactiveQueue", for: .normal)
        return button
    }()
    
    lazy var button7: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(semaphore1), for: .touchUpInside)
        button.setTitle("semaphore1", for: .normal)
        return button
    }()
    
    lazy var button8: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(semaphore3), for: .touchUpInside)
        button.setTitle("semaphore3", for: .normal)
        return button
    }()
    
    lazy var button9: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(semaphore10), for: .touchUpInside)
        button.setTitle("semaphore10", for: .normal)
        return button
    }()
    
    lazy var button10: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(dispatchGrop), for: .touchUpInside)
        button.setTitle("Group", for: .normal)
        return button
    }()
    
    lazy var button11: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(operationOne), for: .touchUpInside)
        button.setTitle("Operation 1", for: .normal)
        return button
    }()
    
    lazy var button12: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPurple
        button.addTarget(self, action: #selector(operationTwo), for: .touchUpInside)
        button.setTitle("Operation 2", for: .normal)
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
        view.addSubview(button6)
        view.addSubview(button7)
        view.addSubview(button8)
        view.addSubview(button9)
        view.addSubview(button10)
        view.addSubview(button11)
        view.addSubview(button12)
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
            
            button6.topAnchor.constraint(equalTo: button5.bottomAnchor, constant: 10.0),
            button6.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button6.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button6.heightAnchor.constraint(equalToConstant: 30),
            
            button7.topAnchor.constraint(equalTo: button6.bottomAnchor, constant: 10.0),
            button7.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button7.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button7.heightAnchor.constraint(equalToConstant: 30),
            
            button8.topAnchor.constraint(equalTo: button7.bottomAnchor, constant: 10.0),
            button8.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button8.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button8.heightAnchor.constraint(equalToConstant: 30),
            
            button9.topAnchor.constraint(equalTo: button8.bottomAnchor, constant: 10.0),
            button9.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button9.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button9.heightAnchor.constraint(equalToConstant: 30),
            
            button10.topAnchor.constraint(equalTo: button9.bottomAnchor, constant: 10.0),
            button10.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button10.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button10.heightAnchor.constraint(equalToConstant: 30),
            
            button11.topAnchor.constraint(equalTo: button10.bottomAnchor, constant: 10.0),
            button11.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button11.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button11.heightAnchor.constraint(equalToConstant: 30),
            
            button12.topAnchor.constraint(equalTo: button11.bottomAnchor, constant: 10.0),
            button12.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            button12.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            button12.heightAnchor.constraint(equalToConstant: 30),
            
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
    
    @objc func delayedLaunch() { //отложенный запуск
        let second = 5
        afterBlock(second: second) {
            print("прошло \(second) секунд")
        }
    }
    
    func afterBlock(second: Int, queue: DispatchQueue =
                    DispatchQueue.global(), complition: @escaping ()->()) {
        queue.asyncAfter(deadline: .now() + .seconds(second)) {
            complition()
        }
    }
    
    @objc func inactiveQueue() {
        let inactiveQueue = DispatchQueue(label: "Inactive", attributes: [.concurrent, .initiallyInactive])
        
        inactiveQueue.async {
            print("Done")
        }
        print("Not yet startet...")
        inactiveQueue.activate()
    }
    
    @objc func semaphore1() {
        print("_______________________")
        semaphoreExample(threads: 1)
    }
    @objc func semaphore3() {
        print("_______________________")
        semaphoreExample(threads: 3)
    }
    @objc func semaphore10() {
        print("_______________________")
        semaphoreExample(threads: 10)
    }
    
    func semaphoreExample(threads: Int) {
        let queue = DispatchQueue(label: "queue", attributes: .concurrent)
        let sepahore = DispatchSemaphore(value: threads)
        
        queue.async {
            sepahore.wait() // -1
            sleep(2)
            print("method 1")
            sepahore.signal() // +1
        }
        queue.async {
            sepahore.wait() // -1
            sleep(2)
            print("method 2")
            sepahore.signal() // +1
        }
        queue.async {
            sepahore.wait() // -1
            sleep(2)
            print("method 3")
            sepahore.signal() // +1
        }
        queue.async {
            sepahore.wait() // -1
            sleep(2)
            print("method 4")
            sepahore.signal() // +1
        }
    }
    
    
    @objc func dispatchGrop() {
        download()
    }
    
    func download() {
        let queue = DispatchQueue(label: "q", attributes: .concurrent)
        let groupOne = DispatchGroup()
        
        groupOne.enter()
        queue.async {
            sleep(2)
            print("one")
            groupOne.leave()
        }
        groupOne.enter()
        queue.async {
            sleep(5)
            print("two")
            groupOne.leave()
        }
        groupOne.enter()
        queue.async {
            sleep(3)
            print("three")
            groupOne.leave()
        }
        
        groupOne.wait()
        print("Finish all")
        
        
        groupOne.notify(queue: .main) {
            print("все задачи выполнены а эта выполняется в \(Thread.current)")
        }
        
    }
    
    
    
    @objc func operationOne() {

        print(Thread.current)
        var string = "__"
        let operation = BlockOperation {
            string = "he he he"
            print(Thread.current)
        }
        
        let queue = OperationQueue() //автоматически создает канкарент очередь
        queue.addOperation(operation)
        sleep(1)
        print(string)
    }
    
    @objc func operationTwo() {

        print(Thread.current)
 
        let operation1 = BlockOperation {
            sleep(1)
            print("operation1")
            print(Thread.current)
        }
        
        let operation2 = BlockOperation {
            sleep(6)
            print("operation2")
            print(Thread.current)
        }
        
        let operation3 = BlockOperation {
            sleep(3)
            print("operation3")
            operation2.cancel()
            print(operation2.isCancelled)
            print(Thread.current)
        }
        
        let queue = OperationQueue()
        queue.addOperation(operation1)
        queue.addOperation(operation2)
        queue.addOperation(operation3)
        //operation2.cancel()
    }
}
