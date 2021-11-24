//
//  ViewController2.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 18.10.2021.
//

import UIKit

class LifecycleVC: UIViewController {
    
    lazy var button = initButton()
    var label: String? {
        didSet{
            print("18.DidSetLabel")
        }
    }
    
    // срабатывает как только появляется команда для загркзки экрана
    override func awakeFromNib() {
        print("18.awakeFromNib")
    }
    
    // срабатывает после загрузки view
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.addSubview(button)
        initConstraints()
        print("18.viewDidLoad")

    }
    
    override func loadView() {
        super.loadView()
        print("18.loadView")
//        let view = UIView()
//        self.view = view
    }
    
    
    // срабатывает перед появление view на экрне
    override func viewWillAppear(_ animated: Bool) {
        print("18.viewWillAppear")
    }
    
    //  срабатывает при изменении размера view
    override func viewWillLayoutSubviews() {
        print("18.viewWillLayoutSubviews")
    }
    
    // срабытвает после изменения рахмера view
    override func viewDidLayoutSubviews() {
        print("18.viewDidLayoutSubviews")
    }
    
    // срабатывает после появления view на экрне
    override func viewDidAppear(_ animated: Bool) {
        print("18.viewDidAppear")
    }
    
    // срабатывает при нехватке памяти
    override func didReceiveMemoryWarning() {
        print("18.didReceiveMemoryWarning")
    }
    
    // срабатывает при смене ориентации view
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        print("18.viewWillTransition")
    }
    
    // срабатывает перед тем как view будет закрыта
    override func viewWillDisappear(_ animated: Bool) {
        print("18.viewWillDisappear")
    }
    
    // срабатывает после того как view закрылась
    override func viewDidDisappear(_ animated: Bool) {
        print("18.viewDidDisappear")
    }
    
    // срабатывает когда объект выгружается из памяти 
    deinit {
        print("18.deinit")
    }
    
    
    
    
    func initConstraints() {
        NSLayoutConstraint.activate([button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     button.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    func initButton() -> UIButton {
        let button = UIButton()
        button.tintColor = .white
        button.setTitle("Button 1", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(.none, action: #selector(tapButton), for: .touchDown)
        return button
    }
    
    @objc func tapButton() {
        print("pushViewController_1")
        let newVC = ViewController()
        self.navigationController?.pushViewController(newVC, animated: true)
        
    }
  
}
