//
//  SOLIDViewController.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 03.12.2021.
//

import Foundation
import UIKit


//MARK - S
class S {
    var view = UIView()
    
    //not good
    private func createLabel() {
        let label = UILabel()
        label.text = "wtf"
        view.addSubview(label)
    }
    
    //good
    private func createLabel2()->UILabel {
        let label = UILabel()
        label.text = "wtf"
        return label
    }
    
    private func addLabel() {
        let label = createLabel2()
        view.addSubview(label)
    }
    
}
//MARK - O
class O {
    
}
