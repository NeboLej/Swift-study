//
//  ViewController.swift
//  ProjectTESTS
//
//  Created by Anton Pakhomov on 17.11.2021.
//

import UIKit

class UnderTests: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func myltiply(a: Int, b: Int) -> Int {
        return a*b
    }
    
    func halfWeek(number: Int) -> String {
        var result = ""
        switch number {
        case 1:
          result = "понедельник"
        case 2:
            result = "вторник"
        case 3:
            result = "среда"
        default:
            result = "Ошибка!"
        }
        return result
    }


}

