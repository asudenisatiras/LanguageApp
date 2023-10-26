//
//  NativeLanguageViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//

import UIKit

class NativeLanguageViewController: UIViewController {
   
    private var turkishButton: UIButton!
    private var englishButton: UIButton!
    private var germanButton: UIButton!
    private var spanishButton: UIButton!
 
    private var turkishImageView: UIImageView!
    private var englishImageView: UIImageView!
    private var germanImageView: UIImageView!
    private var spanishImageView: UIImageView!
    
    
    private var turkishLabel: UILabel!
    private var englishLabel: UILabel!
    private var germanLabel: UILabel!
    private var spanishLabel: UILabel!
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What is your native language?"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
    
    private func style() {
        view.backgroundColor = .white
    }
    
    private func layout() {
        view.addSubview(titleLabel)
       
        let languageButtons: [(UIButton, UIImageView, UILabel)] = [
            createLanguageButton(imageName: "turkish", labelText: "TURKISH"),
            createLanguageButton(imageName: "english", labelText: "ENGLISH"),
            createLanguageButton(imageName: "german", labelText: "GERMAN"),
            createLanguageButton(imageName: "spanish", labelText: "SPANISH")
        ]
        
        var previousButton: UIButton? = nil
        
        for (button, imageView, label) in languageButtons {
            view.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                button.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1),
                button.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
            ])
            
            if let previous = previousButton {
             
                button.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 30).isActive = true
            } else {
               
                button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30).isActive = true
            }
            
            button.addSubview(imageView)
            button.addSubview(label)
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

            NSLayoutConstraint.activate([
                imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 30),
                imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                label.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -100),
                label.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                       ])
            
          
            previousButton = button
        }
    }
}
