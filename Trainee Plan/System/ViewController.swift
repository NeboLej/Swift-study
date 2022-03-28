//
//  ViewController.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 14.10.2021.
//

import UIKit

class ViewController: UIViewController {

    
    lazy var button21: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_Animation", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goAnimationScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button22: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_Collection_And_Table", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goTableViewScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button151: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_URL_Session", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goURLSessionScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button152: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_WebSocket", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goWebSocketScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button153: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_Alomofire", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goRestAlamofireScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button18: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_Life_Cycle", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goLifeCycleScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button131: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_Core_Data", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goDataStorageScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button132: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_User_Defaults", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goUserDefaultsScreen), for: .touchUpInside)
        return button
    }()
    
    lazy var button20: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_ReusableResourses", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goSettingVC), for: .touchUpInside)
        return button
    }()
    
    lazy var button161: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_Combine", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goCombineVC), for: .touchUpInside)
        return button
    }()
    
    
    lazy var button162: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_RX", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goRxSwiftVC), for: .touchUpInside)
        return button
    }()
    lazy var button111: UIButton = {
        var button = initButton(title: NSLocalizedString("VC_GCD", tableName: "Localization", bundle: .main, value: "---", comment: ""))
        button.addTarget(self, action: #selector(goGCDVC), for: .touchUpInside)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .vertical
        stackView.contentMode = .top
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow

        view.addSubview(stackView)
        initConstraints()
        fillInStackView()
        
//        functional()

    }
    
    //test FunctionalProgramming
    func functional() {
        let fp = FunctionalProgramming()
        fp.map_()
        fp.compactMap_()
        fp.filter_()
        fp.reduce_()
        fp.flatMap_()
    }
    
    func fillInStackView() {
        stackView.addArrangedSubview(button111)
        stackView.addArrangedSubview(button131)
        stackView.addArrangedSubview(button132)
        stackView.addArrangedSubview(button151)
        stackView.addArrangedSubview(button152)
        stackView.addArrangedSubview(button153)
        stackView.addArrangedSubview(button161)
        stackView.addArrangedSubview(button162)
        stackView.addArrangedSubview(button18)
        stackView.addArrangedSubview(button20)
        stackView.addArrangedSubview(button21)
        stackView.addArrangedSubview(button22)
    }
        
    func initConstraints() {
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    func initButton(title: String) -> UIButton {
        let button = UIButton()
        button.tintColor = .white
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemPurple
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    func navigation(vc: UIViewController) {
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func goAnimationScreen() {
        let aninationScreen = AnimationsVC()
        navigation(vc: aninationScreen)
    }
    
    @objc func goTableViewScreen() {
        let tableViewScreen = CountryVC()
        navigation(vc: tableViewScreen)
    }
    
    @objc func goURLSessionScreen() {
        let urlSessionScreen = URLSessionVC()
        navigation(vc: urlSessionScreen)
    }
    
    @objc func goWebSocketScreen() {
        let webSocketScreen = WebSocketVC()
        navigation(vc: webSocketScreen)
    }
    
    @objc func goLifeCycleScreen() {
        let lifeCycleScreen = LifecycleVC()
        navigation(vc: lifeCycleScreen)
    }
    
    @objc func goRestAlamofireScreen() {
        let restAlamodireScreen = RestAlamofireVC()
        navigation(vc: restAlamodireScreen)
    }
    
    @objc func goDataStorageScreen() {
        let dataStorageScreen = DataStorageVC()
        navigation(vc: dataStorageScreen)
    }
    @objc func goUserDefaultsScreen() {
        let userDefaultsScreen = UserDefaultsVC()
        navigation(vc: userDefaultsScreen)
    }
    
    @objc func goSettingVC() {
        let settingVC = SettingsVC()
        navigation(vc: settingVC)
    }
    
    @objc func goCombineVC() {
        let combineVC = CombineVC()
        navigation(vc: combineVC)
    }
    
    @objc func goRxSwiftVC() {
        let rxSwiftVC = RxSwiftVC()
        navigation(vc: rxSwiftVC)
    }
    
    @objc func goGCDVC() {
        let GCDVC = GCDVC()
        navigation(vc: GCDVC)
    }

}

