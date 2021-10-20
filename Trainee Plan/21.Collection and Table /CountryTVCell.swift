//
//  CountryTVCell.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 20.10.2021.
//

import UIKit

class CountryTVCell: UITableViewCell {
    
    var name: UILabel = UILabel()
        
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(name)
        name.translatesAutoresizingMaskIntoConstraints = false
        initConstraint()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func initConstraint() {
        name.topAnchor.constraint(equalTo: topAnchor).isActive = true
        name.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        name.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        name.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

}
