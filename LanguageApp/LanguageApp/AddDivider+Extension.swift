//
//  AddDivider+Extension.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//


import UIKit

extension UIView {
    @discardableResult
    func addDivider(withText text: String, color: UIColor = .gray, font: UIFont = .boldSystemFont(ofSize: 14)) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = font
        label.textAlignment = .left
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        let leftLine = UIView()
        leftLine.backgroundColor = color
        leftLine.backgroundColor = .lightGray
        addSubview(leftLine)
        leftLine.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leftLine.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            leftLine.trailingAnchor.constraint(equalTo: label.leadingAnchor, constant: -8),
            leftLine.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            leftLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        let rightLine = UIView()
        rightLine.backgroundColor = color
        addSubview(rightLine)
        rightLine.translatesAutoresizingMaskIntoConstraints = false
        rightLine.backgroundColor = .lightGray
        NSLayoutConstraint.activate([
            rightLine.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            rightLine.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            rightLine.centerYAnchor.constraint(equalTo: label.centerYAnchor),
            rightLine.heightAnchor.constraint(equalToConstant: 1)
        ])
        return label
    }
}

