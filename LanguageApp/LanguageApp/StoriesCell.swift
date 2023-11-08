//
//  StoriesCell.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 28.10.2023.
//

import UIKit

final class StoriesCell: UITableViewCell {
    static let reuseID = "SettingsCell"
 
     let storyName: UILabel = {
        let label = UILabel()
        label.text = "Eliza's Day at the Park"
        label.numberOfLines = 0
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private var doneButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "circle"), for: .normal)
        button.tintColor = .systemGray
        return button
    }()
    private let containerView: UIView = {
          let view = UIView()
          view.backgroundColor = .white
          view.layer.cornerRadius = 10
          view.layer.shadowColor = UIColor.darkGray.cgColor
          view.layer.shadowOpacity = 0.2
          view.layer.shadowOffset = CGSize(width: 0, height: 1)
          view.layer.shadowRadius = 2
          view.translatesAutoresizingMaskIntoConstraints = false
          return view
      }()
    private var stackView: UIStackView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: StoriesCell.reuseID)
        setup()
        layout()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension StoriesCell {
    private func setup() {
        backgroundColor = .clear
        
        stackView = UIStackView(arrangedSubviews: [
                                                   storyName,
                                                   UIView(),
                                                   doneButton,
                                                  ])
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false

    }
    private func layout() {
        containerView.addSubview(stackView)
        
        addSubview(containerView)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            doneButton.widthAnchor.constraint(equalToConstant: 50),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
        ])
    }
}

