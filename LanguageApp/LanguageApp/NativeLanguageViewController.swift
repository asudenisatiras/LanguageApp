//
//  NativeLanguageViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//

import UIKit

class NativeLanguageViewController: UIViewController {
    
    private var selectedButton: UIButton?
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What is your native language?"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    private func createLanguageButton(imageName: String, labelText: String) -> (UIButton, UIImageView, UILabel) {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(languageButtonTapped(_:)), for: .touchUpInside)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        let label = UILabel()
        label.text = labelText
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return (button, imageView, label)
    }
    
    @objc private func languageButtonTapped(_ sender: UIButton) {
        // Deselect the previously selected button
        selectedButton?.backgroundColor = .clear
        selectedButton?.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        
        // Select the newly tapped button
        sender.backgroundColor = UIColor(red: 243/255, green: 241/255, blue: 255/255, alpha: 1)
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor(red: 110/255, green: 79/255, blue: 255/255, alpha: 1).cgColor
        selectedButton = sender
        
        nextButton.isEnabled = true
        nextButton.backgroundColor = UIColor(red: 110/255, green: 79/255, blue: 255/255, alpha: 1)
    }
    
    @objc private func nextButtonTapped() {
//        let homeViewController = LanguagetoLearnViewController()
//        homeViewController.modalPresentationStyle = .fullScreen
//        present(homeViewController, animated: true, completion: nil)
        let homeViewController = LanguagetoLearnViewController()
           let navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController.modalPresentationStyle = .fullScreen
           present(navigationController, animated: true, completion: nil)
        }
}

extension NativeLanguageViewController {
    
    private func style() {
        view.backgroundColor = .white
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(nextButton)
        
        let languageButtons: [(UIButton, UIImageView, UILabel)] = [
            createLanguageButton(imageName: "turkish", labelText: "TURKISH"),
            createLanguageButton(imageName: "english", labelText: "ENGLISH"),
            createLanguageButton(imageName: "german", labelText: "GERMAN"),
            createLanguageButton(imageName: "spanish", labelText: "SPANISH")
        ]
        
        var previousButton: UIButton? = nil
        for (button, imageView, label) in languageButtons {
            view.addSubview(button)
            button.addSubview(imageView)
            button.addSubview(label)
            
            if let previous = previousButton {
                button.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 30).isActive = true
            } else {
                
                button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
            }
            previousButton = button
            
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
                button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
                
                titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 30),
                imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                label.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -100),
                label.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                
                nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
                nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.045),
                nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
                nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        }
    }
}
