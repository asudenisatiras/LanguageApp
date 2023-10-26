//
//  HomeViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var collectionView: UICollectionView!
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hi Ahmet, Welcome"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    override func viewDidLoad() {
        style()
        layout()
    }
}
extension HomeViewController {
    
    private func style(){
        view.backgroundColor = .white
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        collectionView.register(HomeCell.self, forCellWithReuseIdentifier: HomeCell.reuseID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func layout(){
        view.addSubview(titleLabel)
        view.addSubview(collectionView)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.reuseID, for: indexPath) as! HomeCell
        let imageNames = ["a1", "a2", "b1", "b2", "c1", "c2"]
            cell.imageName = imageNames[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
                let selectTopicViewController = SelectTopicViewController()
                   let navigationController = UINavigationController(rootViewController: selectTopicViewController)
                navigationController.modalPresentationStyle = .fullScreen
                   present(navigationController, animated: true, completion: nil)
    }
}
