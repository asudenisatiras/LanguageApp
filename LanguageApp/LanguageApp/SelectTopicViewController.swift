//
//  SelectTopicViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//
import UIKit

class SelectTopicViewController: UIViewController {
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "What do you think you are lacking in?"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        return label
    }()
    
    private var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.backgroundColor = UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1) 
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isEnabled = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    let buttonTitles = ["Reading", "Writing", "Shuffle", "Listening", "Frequently used sentences"]
    var selectedButton: UIButton?
    override func viewDidLoad() {
        style()
        layout()
        buttonSet()
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .systemIndigo
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    
    func buttonSet() {
        for (index, title) in buttonTitles.enumerated() {
            let button = UIButton()
            button.setTitle(title, for: .normal)
            button.layer.cornerRadius = 8
            button.layer.borderWidth = 1
            button.setTitleColor(UIColor.black, for: .normal)
            button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
            button.translatesAutoresizingMaskIntoConstraints = false
            button.tintColor = .black
            view.addSubview(button)

            
            if let image = UIImage(named: "\(title.lowercased())_image") {
                button.setImage(image, for: .normal)
                button.imageView?.contentMode = .scaleAspectFit
                button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            }

            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

            NSLayoutConstraint.activate([
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                button.heightAnchor.constraint(equalToConstant: 50),
                button.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: CGFloat(50 + index * 70))
            ])
        }
    }


    @objc func buttonTapped(_ sender: UIButton) {
        if let selectedButton = selectedButton {
            selectedButton.layer.borderWidth = 1
            selectedButton.backgroundColor = .clear
            selectedButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        }
        sender.backgroundColor = UIColor(red: 243/255, green: 241/255, blue: 255/255, alpha: 1)
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor(red: 110/255, green: 79/255, blue: 255/255, alpha: 1).cgColor
        selectedButton = sender
        nextButton.isEnabled = true
        nextButton.backgroundColor = UIColor(red: 110/255, green: 79/255, blue: 255/255, alpha: 1)
    }
    @objc func nextButtonTapped() {
        guard let selectedButton = selectedButton, let title = selectedButton.title(for: .normal) else {
            
            return
        }
        
        switch title {
        case "Reading":
            let readingViewController = ReadingViewController()
            navigationController?.pushViewController(readingViewController, animated: true)
        case "Writing":
            let writingViewController = WritingViewController()
            navigationController?.pushViewController(writingViewController, animated: true)
        case "Shuffle":
            let shuffleViewController = ShuffleViewController()
            navigationController?.pushViewController(shuffleViewController, animated: true)
        case "Listening":
            let listeningViewController = ListeningViewController()
            navigationController?.pushViewController(listeningViewController, animated: true)
        case "Frequently used sentences":
            let sentencesViewController = SentencesViewController()
            navigationController?.pushViewController(sentencesViewController, animated: true)
        default:
            break
        }
    }
}

extension SelectTopicViewController {
    
    private func style(){
        view.backgroundColor = .white
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        view.addSubview(nextButton)
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.045),
            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}












//import UIKit
//
//final class SelectTopicViewController: UIViewController {
//    
//    private var titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "What do you think you are lacking in?"
//        label.font = UIFont.boldSystemFont(ofSize: 20)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.numberOfLines = 2
//        return label
//    }()
//    
//    private var favoriteStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 10
//        return stackView
//    }()
//    
//    private var nextButton: UIButton = {
//           let button = UIButton()
//           button.setTitle("Next", for: .normal)
//           button.backgroundColor = UIColor(red: 169/255, green: 169/255, blue: 169/255, alpha: 1) // Set gray background
//           button.layer.cornerRadius = 8
//           button.translatesAutoresizingMaskIntoConstraints = false
//           button.isEnabled = false // Initially, the button is disabled
//           button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
//           return button
//       }()
//    
//    
//    @objc private func nextButtonTapped() {
//        
//        }
//    override func viewDidLoad() {
//        style()
//        layout()
//        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
//                backButton.tintColor = UIColor(red: 74/255, green: 55/255, blue: 128/255, alpha: 1)
//                navigationItem.leftBarButtonItem = backButton
//    }
//    @objc private func backButtonTapped() {
//          navigationController?.dismiss(animated: true, completion: nil)
//      }
//}
//
//extension SelectTopicViewController {
//    private func style() {
//        view.backgroundColor = .white
//
//        let favoriteTexts = ["Reading", "Writing", "Shuffle", "Listening", "Frequently used sentences"]
//        for text in favoriteTexts {
//            let favoriteItemView = TopicItemView(favoriteText: text)
//            favoriteStackView.addArrangedSubview(favoriteItemView)
//        }
//    }
//
//    private func layout() {
//
//        view.addSubview(titleLabel)
//        view.addSubview(nextButton)
//        view.addSubview(favoriteStackView)
//        
//        NSLayoutConstraint.activate([
//            
//            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            favoriteStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
//            favoriteStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40),
//            favoriteStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            
//            
//            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
//            nextButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.045),
//            nextButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
//            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        ])
//    }
//}
