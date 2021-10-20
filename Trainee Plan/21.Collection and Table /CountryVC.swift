//
//  CountryVC.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 19.10.2021.
//

import UIKit

class CountryVC: UIViewController {
    private let layout = UICollectionViewFlowLayout()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .black
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CountryCVCell.self, forCellWithReuseIdentifier: "CollectionCell")

        return collectionView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .black
        tableView.register(CountryTVCell.self, forCellReuseIdentifier: "TableCell")
        return tableView
    }()
    
    lazy var arrayCountry: [CountryModel] = initArray()
    var currentModel: CountryModel = CountryModel(name: "", flag: "", population: "")

    override func viewDidLoad() {
        super.viewDidLoad()
    
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 25
        
        view.addSubview(collectionView)
        view.addSubview(tableView)
        initConstraints()

    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                                     collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                                     collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                                     collectionView.heightAnchor.constraint(equalToConstant:  200),
                                     
                                     tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
                                     tableView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20),
                                     tableView.heightAnchor.constraint(equalToConstant:  200),
                                    ])
    }
    
    
    func initArray() -> [CountryModel] {
        var array: [CountryModel] = []
        for i in Data.data {
            let country = CountryModel(name: i[0], flag: i[1], population: i[2])
            array.append(country)
        }
        return array
    }

}


extension CountryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currentModel = arrayCountry[indexPath.row]
        tableView.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayCountry.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CountryCVCell
        cell.imageView.image = UIImage(named: arrayCountry[indexPath.item].flag)
        cell.label.text = arrayCountry[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                           sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 550/2,
                      height: 367/2)
       }
        
}

extension CountryVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! CountryTVCell
        switch indexPath.row {
        case 0: cell.textLabel?.text = currentModel.name
                cell.accessoryType = .detailButton
        case 1: cell.textLabel?.text = currentModel.population
                cell.accessoryType = .detailButton
        default:
            print("EROOOOOOR")
        }
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        return cell
    }
    
    
}
