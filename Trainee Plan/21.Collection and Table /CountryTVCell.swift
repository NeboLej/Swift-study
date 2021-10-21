//
//  CountryTVCell.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 20.10.2021.
//

import UIKit

class CountryTVCell: UITableViewCell {
    
    var name: UILabel = UILabel()
    var color = UIColor()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 100, right: 10))
        name.textColor = .white
        name.translatesAutoresizingMaskIntoConstraints = false
        addSubview(name)
        initConstraint()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

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
    
    override func draw(_ rect: CGRect) {
        let pathRect = CGRect(x: frame.width - 100, y: 15, width: 90, height: 2)
        let path = UIBezierPath(roundedRect: pathRect, cornerRadius: 1)
        let color = color
        color.setFill()
        path.fill()
    }


}
