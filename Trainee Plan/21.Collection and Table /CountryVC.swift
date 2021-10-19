//
//  CountryVC.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 19.10.2021.
//

import UIKit

class CountryVC: UIViewController {
    private let layout = UICollectionViewFlowLayout()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    lazy var arrayCountry: [CountryModel] = initArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout.scrollDirection = .horizontal
        view.addSubview(collectionView)
        initCollectionView()
        initConstraints()

        // Do any additional setup after loading the view.
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                                     collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                                     collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                                     collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
                                     //collectionView.widthAnchor.constraint(equalToConstant: view.bounds.width/2)
                                    ])
    }
    
    func initCollectionView(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .green
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CountryCVCell.self, forCellWithReuseIdentifier: "CollectionCell")
    }
    
    func initArray() -> [CountryModel] {
        var array: [CountryModel] = []
        for i in Data.data {
            let country = CountryModel(name: i.0, flag: i.1, population: i.2)
            array.append(country)
        }
        return array
    }

}


extension CountryVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Data.data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath)
        cell.largeContentTitle = arrayCountry[1].name
        cell.backgroundColor = .orange
        return cell
    }
    
    
    
}
