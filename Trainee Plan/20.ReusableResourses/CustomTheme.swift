//
//  CustomTreme.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 24.11.2021.
//

import Foundation
import UIKit

struct CustomTheme {
    
    var backgroungColor: UIColor = .white
    var labelColor: UIColor = .white
    var buttonColor: UIColor = .white
    
    
    mutating func getTheme(theme: Theme) {
        switch theme {
        case .acidGreen:
            self.backgroungColor = UIColor(named: "AGBackground")!
            self.labelColor = UIColor(named: "AGLabel")!
            self.buttonColor = UIColor(named: "AGButton")!
        case .painEyes:
            self.backgroungColor = UIColor(named: "PEBackground")!
            self.labelColor = UIColor(named: "PELabel")!
            self.buttonColor = UIColor(named: "PEButton")!
        }
    }
    
    
    
    enum Theme {
        case acidGreen
        case painEyes
    }
    
    
}
