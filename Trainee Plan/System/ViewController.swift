//
//  ViewController.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 14.10.2021.
//

import UIKit

class ViewController: UIViewController {

    var basic = Basics()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        basic.dataTypes()
        
    }


}

