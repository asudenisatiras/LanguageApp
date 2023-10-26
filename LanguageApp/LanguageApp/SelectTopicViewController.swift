//
//  SelectTopicViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//

import UIKit


final class SelectTopicViewController: UIViewController {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you think you are lacking in?"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    
    private var favoriteStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
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
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
                backButton.tintColor = UIColor(red: 74/255, green: 55/255, blue: 128/255, alpha: 1)
                navigationItem.leftBarButtonItem = backButton
    }
    @objc private func backButtonTapped() {
          navigationController?.dismiss(animated: true, completion: nil)
      }
}

extension SelectTopicViewController {
    private func style() {
        view.backgroundColor = .white

        let favoriteTexts = ["Reading", "Writing", "Shuffle", "Listening", "Frequently used sentences"]
        for text in favoriteTexts {
            let favoriteItemView = TopicItemView(favoriteText: text)
            favoriteStackView.addArrangedSubview(favoriteItemView)
        }
    }

    private func layout() {

        view.addSubview(titleLabel)
        view.addSubview(nextButton)
        view.addSubview(favoriteStackView)
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            favoriteStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            favoriteStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
            favoriteStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.045),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
