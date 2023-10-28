//
//  StoryViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 28.10.2023.
//

import UIKit

class StoryViewController: UIViewController {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Turkish-English"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    private var nativeLanguageLabel: UILabel = {
        let label = UILabel()
        label.text = "Eliza genç bir kızdır. Onun kırmızı bir topu var. Topunu çok seviyor. Bugün, parka gider. Eliza topuyla oynar. Onu yükseğe fırlatır. Top uçar ve geri gelir. Eliza mutludur. Tüm gün oynar."
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.layer.borderWidth = 0.7
        label.backgroundColor = .white
        label.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        label.layer.cornerRadius = 8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var learningLanguageLabel: UILabel = {
        let label = UILabel()
        label.text = "Eliza is a young girl. She has a red ball. She loves her ball. Today, she goes to the park. Eliza plays with her ball. She throws it high into the sky. The ball flies and comes back. Eliza is happy. She plays all day."
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.layer.borderWidth = 0.7
        label.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/55, alpha: 1)
        label.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        label.layer.cornerRadius = 8
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        style()
        layout()
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .systemIndigo
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
}
extension StoryViewController {
    
    private func style(){
        view.backgroundColor = .systemBackground
    }
    
    private func layout(){
        view.addSubview(titleLabel)
        view.addSubview(nativeLanguageLabel)
        view.addSubview(learningLanguageLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nativeLanguageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            nativeLanguageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nativeLanguageLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.22),
            nativeLanguageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            learningLanguageLabel.topAnchor.constraint(equalTo: nativeLanguageLabel.bottomAnchor, constant: 40),
            learningLanguageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            learningLanguageLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.22),
            learningLanguageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
        ])
    }
}
