//
//  HomeCell.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//

import UIKit

final class HomeCell: UICollectionViewCell {
    static let reuseID = "HomeCell"
    private var photoImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .systemPink
        imageView.backgroundColor = .lightGray
        imageView.image = UIImage(named: "b1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 12
        return imageView
    }()
    private var levelLabel: UILabel = {
        let label = UILabel()
        label.text = "A1"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Beginner Level"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    var imageName: String? {
          didSet {
              if let imageName = imageName {
                  photoImageView.image = UIImage(named: imageName)
                  levelLabel.text = imageName.uppercased()
                  descriptionLabel.text = "Level \(imageName.prefix(1).uppercased() + imageName.dropFirst(1))"
              }
          }
      }
    private var labelStackView: UIStackView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension HomeCell {
 
    private func setup() {
       
        backgroundColor = .white
        labelStackView = UIStackView(arrangedSubviews: [levelLabel,
                                                        descriptionLabel,
                                                  ])
        labelStackView.axis = .vertical
        labelStackView.distribution = .fillEqually
        labelStackView.spacing = 0
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
      
    }
    private func layout() {
        addSubview(photoImageView)
        photoImageView.addSubview(labelStackView)
        NSLayoutConstraint.activate([
            
            photoImageView.widthAnchor.constraint(equalTo: widthAnchor),
            photoImageView.heightAnchor.constraint(equalTo: heightAnchor),
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            labelStackView.leadingAnchor.constraint(equalTo: photoImageView.leadingAnchor, constant: 10),
            labelStackView.bottomAnchor.constraint(equalTo: photoImageView.bottomAnchor, constant: -10)
            
        ])
    }
}

