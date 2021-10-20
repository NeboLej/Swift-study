//
//  CountryCVCell.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 19.10.2021.
//

import UIKit

class CountryCVCell: UICollectionViewCell {
    
    var label = UILabel()
    var imageView = UIImageView()
    
    let flag = UIImageView()
    var name = String() {
        didSet{
            initName()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(label)
        addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initName() {
        label.text = name
        label.textAlignment = .center
        label.font = UIFont(name: "AvenirNext-Regular", size: 10)
        label.frame = frame
        self.addSubview(label)
    }
    
}
