//
//  HomeViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//

import UIKit

class HomeViewController: UIViewController {
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What is your native language?"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var turkishButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private var turkishImageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "turkish") // Resmin adını değiştirin
        imageView.contentMode = .scaleAspectFill
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }()
        
        private var turkishLabel: UILabel = {
            let label = UILabel()
            label.text = "TURKISH" // İstenilen metni ekleyin
            label.font = UIFont.boldSystemFont(ofSize: 18)
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
    }
    
    private func layout(){
        view.addSubview(titleLabel)
        view.addSubview(turkishButton)
        turkishButton.addSubview(turkishImageView)
        turkishButton.addSubview(turkishLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            turkishButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            turkishButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            turkishButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            turkishButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            turkishImageView.leadingAnchor.constraint(equalTo: turkishButton.leadingAnchor, constant: 30),
            turkishImageView.centerYAnchor.constraint(equalTo: turkishButton.centerYAnchor),
//            turkishImageView.widthAnchor.constraint(equalToConstant: 60), // Resim boyutunu ayarlayın
//            turkishImageView.heightAnchor.constraint(equalToConstant: 40), // Resim boyutunu ayarlayın
            
            turkishLabel.trailingAnchor.constraint(equalTo: turkishButton.trailingAnchor, constant: -100),
            turkishLabel.centerYAnchor.constraint(equalTo: turkishButton.centerYAnchor),
        ])
    }
}

