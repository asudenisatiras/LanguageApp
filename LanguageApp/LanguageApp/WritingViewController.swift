//
//  WritingViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 27.10.2023.
//

import UIKit

class WritingViewController: UIViewController {
    
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
        label.text = "Eliza genç bir kızdır."
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
    private var learningLanguageLabel: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.layer.borderWidth = 0.7
        textfield.backgroundColor = UIColor(red: 247/255, green: 248/255, blue: 249/55, alpha: 1)
        textfield.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        textfield.layer.cornerRadius = 8
        textfield.textAlignment = .center
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    private var nextButton: UIButton = {
           let button = UIButton()
           button.setTitle("Next", for: .normal)
           button.backgroundColor = UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1) // Set gray background
           button.layer.cornerRadius = 8
           button.translatesAutoresizingMaskIntoConstraints = false
           button.isEnabled = false // Initially, the button is disabled
           button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
           return button
       }()
    @objc private func nextButtonTapped() {
       
        }

    override func viewDidLoad() {
        style()
        layout()

    }
}
extension WritingViewController {
    
    private func style(){
        view.backgroundColor = .systemBackground
    }
    
    private func layout(){
        view.addSubview(titleLabel)
        view.addSubview(nativeLanguageLabel)
        view.addSubview(learningLanguageLabel)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nativeLanguageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 80),
            nativeLanguageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nativeLanguageLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            nativeLanguageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            learningLanguageLabel.topAnchor.constraint(equalTo: nativeLanguageLabel.bottomAnchor, constant: 40),
            learningLanguageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            learningLanguageLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
            learningLanguageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.045),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
