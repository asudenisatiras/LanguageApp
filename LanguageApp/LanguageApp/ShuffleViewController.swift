//
//  ShuffleViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 27.10.2023.
//

import UIKit

class ShuffleViewController: UIViewController {
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Eşleşen kelimelere dokun"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        addButtons()
    }
    
    private func style() {
        view.backgroundColor = .white
    }
    
    private func layout() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    private func addButtons() {
        let buttonWidth: CGFloat = 150
        let buttonHeight: CGFloat = 50
        let buttonSpacing: CGFloat = 20
        let numberOfRows = 6
        let numberOfColumns = 2
        
        for row in 0..<numberOfRows {
            for col in 0..<numberOfColumns {
                let button = UIButton()
                button.setTitle("Button \(row * numberOfColumns + col + 1)", for: .normal)
                button.backgroundColor = .clear
                button.layer.cornerRadius = 10
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.gray.cgColor
                button.setTitleColor(.black, for: .normal)
                button.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(button)
                
                let centerXAnchor: NSLayoutXAxisAnchor
                if col < numberOfColumns / 2 {
                    centerXAnchor = view.centerXAnchor
                } else {
                    centerXAnchor = view.centerXAnchor
                }
                
                NSLayoutConstraint.activate([
                    button.widthAnchor.constraint(equalToConstant: buttonWidth),
                    button.heightAnchor.constraint(equalToConstant: buttonHeight),
                    button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(row - numberOfRows / 2) * (buttonHeight + buttonSpacing)),
                    button.centerXAnchor.constraint(equalTo: centerXAnchor, constant: col < numberOfColumns / 2 ? -buttonSpacing / 2 - buttonWidth / 2 : buttonSpacing / 2 + buttonWidth / 2),
                ])
            }
        }
    }
}
