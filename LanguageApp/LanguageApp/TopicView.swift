//
//  TopicView.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//

//import UIKit
//
//class TopicItemView: UIView {
//
//    private var selectButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.layer.cornerRadius = 8
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.tintColor = .black
//        return button
//    }()
//    private var topicLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 14)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        return label
//    }()
//    
//
//    init(favoriteText: String) {
//
//        super.init(frame: .zero)
//
//        addSubview(selectButton)
//        selectButton.addSubview(topicLabel)
//
//        NSLayoutConstraint.activate([
//            selectButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
//            selectButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
//            selectButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
//            selectButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
//            selectButton.heightAnchor.constraint(equalToConstant: 50),
//            
//            topicLabel.leadingAnchor.constraint(equalTo: selectButton.leadingAnchor, constant: 20),
//            topicLabel.heightAnchor.constraint(equalTo: selectButton.heightAnchor, multiplier: 1),
//        ])
//
//        topicLabel.text = favoriteText
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}

