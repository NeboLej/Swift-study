//
//  RestAlamofireVC.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 09.11.2021.
//

import Foundation
import Alamofire

class RestAlamofireVC: UIViewController {
    
    let url2 = "https://images.wallpaperscraft.ru/image/single/avokado_minimalizm_rozovyj_120543_3840x2400.jpg"
    let url1 = "https://cs14.pikabu.ru/images/big_size_comm/2021-07_2/1625645991166724912.jpg"
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    lazy var buttonGetImage: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Get image", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(getImage), for: .touchUpInside)
        return button
    }()
    
    lazy var buttonGetBigImage: UIButton = {
        var button = UIButton(type: .system)
        button.setTitle("Get big image ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5.0
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(getBigImage), for: .touchUpInside)
        return button
    }()
    
    lazy var progressLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.text = ""
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        initSubviews()
        initConstraints()
    }
    
    func initSubviews() {
        view.addSubview(imageView)
        view.addSubview(buttonGetImage)
        view.addSubview(buttonGetBigImage)
        view.addSubview(progressLabel)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            imageView.widthAnchor.constraint(equalToConstant: 300),
            
            buttonGetImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonGetImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonGetImage.widthAnchor.constraint(equalToConstant: 100),
            
            buttonGetBigImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonGetBigImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            buttonGetBigImage.widthAnchor.constraint(equalToConstant: 100),
            
            progressLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progressLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            
        ])
        
    }
    
    @objc func getImage() {
        getImageOnAlamofire()
    }
    
    @objc func getBigImage() {
        getBigImageOnAlamofire()
    }
    
    func getImageOnAlamofire() {
        AF.download(url1).responseData { response in
            if let data = response.value {
                let imageData = UIImage(data: data)
                self.imageView.image = imageData
            }
        }
    }
    
    func getBigImageOnAlamofire() {
        AF.download(url2)
            .downloadProgress { progress in
                self.progressLabel.text = progress.localizedDescription
            }
            
            .responseData { response in
            if let data = response.value {
                let imageData = UIImage(data: data)
                self.imageView.image = imageData
            }
        }
    }
    
    
    
    
}
