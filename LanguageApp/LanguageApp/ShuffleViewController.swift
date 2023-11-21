//
//  ShuffleViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 27.10.2023.
//
import UIKit

class ShuffleViewController: UIViewController {
    
    var languageData: [LanguageData] = []
    var selectedButtons: [UIButton] = []
    private var leftStackView: UIStackView!
    private var rightStackView: UIStackView!
    var selectedLeftButton: UIButton?
    var selectedRightButton: UIButton?
 
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
        readJSONFile()
        for leftButton in leftStackView.arrangedSubviews {
              if let button = leftButton as? UIButton {
                  button.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
              }
          }

          // Sağ butonlara dokunma işlemi ekleme
          for rightButton in rightStackView.arrangedSubviews {
              if let button = rightButton as? UIButton {
                  button.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
              }
          }
    }
    
    @objc func leftButtonTapped(_ sender: UIButton) {
        guard !selectedButtons.contains(sender), selectedButtons.count < 2 else {
            return
        }
        
        sender.backgroundColor = UIColor(red: 85/255, green: 167/255, blue: 226/255, alpha: 0.17) // Mavi
        sender.layer.borderWidth = 2
        sender.layer.borderColor =  UIColor(red: 85/255, green: 167/255, blue: 226/255, alpha: 1).cgColor // Mavi
        selectedButtons.append(sender)
        
        // Set the selectedLeftButton variable
        selectedLeftButton = sender
        
        checkAllMatchingIDsAndColorButtons()
    }

    @objc func rightButtonTapped(_ sender: UIButton) {
        guard !selectedButtons.contains(sender), selectedButtons.count < 2 else {

            return
        }
        
        sender.backgroundColor = UIColor(red: 85/255, green: 167/255, blue: 226/255, alpha: 0.17) // Mavi
        sender.layer.borderWidth = 2
        sender.layer.borderColor =  UIColor(red: 85/255, green: 167/255, blue: 226/255, alpha: 1).cgColor // Mavi
        selectedButtons.append(sender)
        
        // Set the selectedRightButton variable
        selectedRightButton = sender
        
        checkAllMatchingIDsAndColorButtons()
    }

    private func checkAllMatchingIDsAndColorButtons() {
        guard selectedButtons.count == 2 else { return }

        guard let leftTitle = selectedButtons[0].currentTitle,
              let rightTitle = selectedButtons[1].currentTitle else { return }

        let leftButton = selectedButtons[0]
        let rightButton = selectedButtons[1]

        guard let leftID = languageData.first(where: { $0.languages?[0].word == leftTitle || $0.languages?[1].word == leftTitle })?.id,
              let rightID = languageData.first(where: { $0.languages?[0].word == rightTitle || $0.languages?[1].word == rightTitle })?.id else {
            return
        }

        if leftID == rightID {
            leftButton.backgroundColor = UIColor(red: 77/255, green: 220/255, blue: 53/255, alpha: 0.17) // Yeşil
            leftButton.layer.borderWidth = 2
            leftButton.layer.borderColor =  UIColor(red: 77/255, green: 220/255, blue: 53/255, alpha: 1).cgColor // Yeşil
            rightButton.backgroundColor = UIColor(red: 77/255, green: 220/255, blue: 53/255, alpha: 0.17) // Yeşil
            rightButton.layer.borderWidth = 2
            rightButton.layer.borderColor =  UIColor(red: 77/255, green: 220/255, blue: 53/255, alpha: 1).cgColor // Yeşil
            disableAllMatchingButtons()
        } else {
            leftButton.backgroundColor = UIColor(red: 255/255, green: 178/255, blue: 178/255, alpha: 0.17) // Kırmızı
            leftButton.layer.borderWidth = 2
            leftButton.layer.borderColor = UIColor(red: 255/255, green: 178/255, blue: 178/255, alpha: 1).cgColor // Kırmızı
            rightButton.backgroundColor = UIColor(red: 255/255, green: 178/255, blue: 178/255, alpha: 0.17) // Kırmızı
            rightButton.layer.borderWidth = 2
            rightButton.layer.borderColor = UIColor(red: 255/255, green: 178/255, blue: 178/255, alpha: 1).cgColor // Kırmızı
            enableAllButtons()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                       self.resetButtonColors()
                   }
        }
        // Reset the selected buttons
        selectedButtons.removeAll()
    }
    private func resetButtonColors() {
        // Reset the color of only the red buttons
        for button in leftStackView.arrangedSubviews {
            if let resetButton = button as? UIButton, resetButton.backgroundColor == UIColor(red: 255/255, green: 178/255, blue: 178/255, alpha: 0.17) {
                UIView.animate(withDuration: 1.0) {
                    resetButton.backgroundColor = .clear
                    resetButton.layer.borderWidth = 1
                    resetButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
                }
            }
        }

        for button in rightStackView.arrangedSubviews {
            if let resetButton = button as? UIButton, resetButton.backgroundColor == UIColor(red: 255/255, green: 178/255, blue: 178/255, alpha: 0.17) {
                UIView.animate(withDuration: 1.0) {
                    resetButton.backgroundColor = .clear
                    resetButton.layer.borderWidth = 1
                    resetButton.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
                }
            }
        }
    }

    private func disableAllMatchingButtons() {
        for button in leftStackView.arrangedSubviews {
            if let matchingButton = button as? UIButton {
                if let currentTitle = matchingButton.currentTitle, currentTitle == selectedLeftButton?.currentTitle {
                    matchingButton.isEnabled = false
                } else {
                    matchingButton.isEnabled = true
                }
            }
        }
        
        for button in rightStackView.arrangedSubviews {
            if let matchingButton = button as? UIButton {
                if let currentTitle = matchingButton.currentTitle, currentTitle == selectedRightButton?.currentTitle {
                    matchingButton.isEnabled = false
                } else {
                    matchingButton.isEnabled = true
                }
            }
        }
    }

    private func enableAllButtons() {
        for button in leftStackView.arrangedSubviews {
            if let nonMatchingButton = button as? UIButton {
                nonMatchingButton.isEnabled = true
            }
        }
        
        for button in rightStackView.arrangedSubviews {
            if let nonMatchingButton = button as? UIButton {
                nonMatchingButton.isEnabled = true
            }
        }
    }

    private var createButtonStackView : UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }
    private var createButton: UIButton {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
  
    func readJSONFile() {
           guard let path = Bundle.main.path(forResource: "language", ofType: "json") else {
               print("File 'language.json' not found.")
               return
           }

           do {
               let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
               let decoder = JSONDecoder()
               languageData = try decoder.decode([LanguageData].self, from: data)
               distributeButtons()
               print("Language Data Count: \(languageData.count)") // Check count after decoding
           } catch {
               print("Error reading JSON: \(error)")
           }
       }
}
extension ShuffleViewController {
    private func layout() {

        leftStackView = createButtonStackView
        rightStackView = createButtonStackView
        view.addSubview(leftStackView)
        view.addSubview(rightStackView)
        

        NSLayoutConstraint.activate([
            leftStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 60),
            leftStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),

            leftStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
            leftStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            
            rightStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 60),
            rightStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            rightStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
            rightStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
        ])

    }

    private func distributeButtons() {
        guard !languageData.isEmpty else { return }

        var selectedIds: [Int] = []

        // 6 farklı ID seçme
        while selectedIds.count < 6 {
            if let randomId = languageData.compactMap({ $0.id }).randomElement(), !selectedIds.contains(randomId) {
                selectedIds.append(randomId)
            }
        }

        var selectedWords: [String] = []
        var selectedTitles: [String] = []

        // Seçilen ID'lerin dil verilerindeki belirli alanları alalım
        for data in languageData {
            if let id = data.id, selectedIds.contains(id), let languages = data.languages {
                if let word = languages[0].word {
                    selectedWords.append(word)
                }
                if let title = languages[1].word {
                    selectedTitles.append(title)
                }
            }
        }
        // Sağdaki butonların sıralamasını değiştirelim
        selectedTitles.shuffle()

        // İlgili verileri butonlara yerleştirelim
        for (index, word) in selectedWords.enumerated() {
            let leftButton = createButton
            leftButton.setTitle(word, for: .normal)
            leftStackView.addArrangedSubview(leftButton)

            let rightButton = createButton
            rightButton.setTitle(selectedTitles[index], for: .normal)
            rightStackView.addArrangedSubview(rightButton)
        }
    }
 
    private func style() {
        view.backgroundColor = .systemBackground
    }
}

//import UIKit
//
//class ShuffleViewController: UIViewController {
//    
//    var languageData: [LanguageData] = []
//    
//    private var leftStackView: UIStackView!
//    private var rightStackView: UIStackView!
//    var selectedLeftButton: UIButton?
//        var selectedRightButton: UIButton?
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        style()
//        layout()
//        readJSONFile()
//        setupButtonActions()
//    }
//    private var createButtonStackView : UIStackView {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.alignment = .fill
//        stackView.distribution = .fillEqually
//        stackView.spacing = 14
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }
//    private var createButton: UIButton {
//        let button = UIButton()
//        button.setTitle("Button", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.cornerRadius = 8
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }
//    private func setupButtonActions() {
//            for case let leftButton as UIButton in leftStackView.arrangedSubviews {
//                leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
//            }
//
//            for case let rightButton as UIButton in rightStackView.arrangedSubviews {
//                rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
//            }
//        }
//
//        @objc func leftButtonTapped(_ sender: UIButton) {
//            if let leftIndex = leftStackView.arrangedSubviews.firstIndex(of: sender) {
//                selectButton(sender, &selectedLeftButton, leftIndex)
//            }
//            checkMatch()
//        }
//
//        @objc func rightButtonTapped(_ sender: UIButton) {
//            if let rightIndex = rightStackView.arrangedSubviews.firstIndex(of: sender) {
//                selectButton(sender, &selectedRightButton, rightIndex)
//            }
//            checkMatch()
//        }
//
//        private func selectButton(_ button: UIButton, _ selectedButton: inout UIButton?, _ index: Int) {
//            if let prevSelected = selectedButton {
//                // Deselect previously selected button
//                prevSelected.backgroundColor = .clear
//            }
//            // Select the new button
//            button.backgroundColor = .blue
//            selectedButton = button
//        }
//
//        private func checkMatch() {
//            guard let leftButton = selectedLeftButton, let rightButton = selectedRightButton else { return }
//            
//            guard let leftIndex = leftStackView.arrangedSubviews.firstIndex(of: leftButton),
//                let rightIndex = rightStackView.arrangedSubviews.firstIndex(of: rightButton) else { return }
//
//            let leftData = languageData[leftIndex]
//            let rightData = languageData[rightIndex]
//
//            if let leftID = leftData.id, let rightID = rightData.id {
//                if leftID == rightID {
//                    leftButton.backgroundColor = .green
//                    rightButton.backgroundColor = .green
//                } else {
//                    leftButton.backgroundColor = .red
//                    rightButton.backgroundColor = .red
//                }
//            }
//            // Reset selections after a short delay
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                self.resetSelections()
//            }
//        }
//
//        private func resetSelections() {
//            selectedLeftButton?.backgroundColor = .clear
//            selectedRightButton?.backgroundColor = .clear
//            selectedLeftButton = nil
//            selectedRightButton = nil
//        }
//    
//    func readJSONFile() {
//           guard let path = Bundle.main.path(forResource: "language", ofType: "json") else {
//               print("File 'language.json' not found.")
//               return
//           }
//
//           do {
//               let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
//               let decoder = JSONDecoder()
//               languageData = try decoder.decode([LanguageData].self, from: data)
//               distributeButtons()
//               print("Language Data Count: \(languageData.count)") // Check count after decoding
//           } catch {
//               print("Error reading JSON: \(error)")
//           }
//       }
//}
//extension ShuffleViewController {
//    private func layout() {
//
//        leftStackView = createButtonStackView
//        rightStackView = createButtonStackView
//        view.addSubview(leftStackView)
//        view.addSubview(rightStackView)
//        
//
//        NSLayoutConstraint.activate([
//            leftStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 60),
//            leftStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
//
//            leftStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
//            leftStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
//            
//            rightStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 60),
//            rightStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
//            rightStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
//            rightStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
//        ])
//
//    }
//
//    private func distributeButtons() {
//        guard !languageData.isEmpty else { return }
//
//        var selectedIds: [Int] = []
//
//        // 6 farklı ID seçme
//        while selectedIds.count < 6 {
//            if let randomId = languageData.compactMap({ $0.id }).randomElement(), !selectedIds.contains(randomId) {
//                selectedIds.append(randomId)
//            }
//        }
//
//        var selectedWords: [String] = []
//        var selectedTitles: [String] = []
//
//        // Seçilen ID'lerin dil verilerindeki belirli alanları alalım
//        for data in languageData {
//            if let id = data.id, selectedIds.contains(id), let languages = data.languages {
//                if let word = languages[0].word {
//                    selectedWords.append(word)
//                }
//                if let title = languages[1].word {
//                    selectedTitles.append(title)
//                }
//            }
//        }
//
//        // Sağdaki butonların sıralamasını değiştirelim
//        selectedTitles.shuffle()
//
//        // İlgili verileri butonlara yerleştirelim
//        for (index, word) in selectedWords.enumerated() {
//            let leftButton = createButton
//            leftButton.setTitle(word, for: .normal)
//            leftStackView.addArrangedSubview(leftButton)
//
//            let rightButton = createButton
//            rightButton.setTitle(selectedTitles[index], for: .normal)
//            rightStackView.addArrangedSubview(rightButton)
//        }
//        
//    }
// 
//    private func style() {
//        view.backgroundColor = .systemBackground
//    }
//}






//import UIKit
//
//class ShuffleViewController: UIViewController {
//    
//    private var titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Eşleşen kelimelere dokun"
//        label.font = UIFont.boldSystemFont(ofSize: 22)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        style()
//        layout()
//        addButtons()
//    }
//    
//    private func style() {
//        view.backgroundColor = .white
//    }
//    
//    private func layout() {
//        view.addSubview(titleLabel)
//        NSLayoutConstraint.activate([
//            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//        ])
//    }
//    
//    private func addButtons() {
//        let buttonWidth: CGFloat = 150
//        let buttonHeight: CGFloat = 50
//        let buttonSpacing: CGFloat = 20
//        let numberOfRows = 6
//        let numberOfColumns = 2
//        
//        for row in 0..<numberOfRows {
//            for col in 0..<numberOfColumns {
//                let button = UIButton()
//                button.setTitle("Button \(row * numberOfColumns + col + 1)", for: .normal)
//                button.backgroundColor = .clear
//                button.layer.cornerRadius = 10
//                button.layer.borderWidth = 1
//                button.layer.borderColor = UIColor.gray.cgColor
//                button.setTitleColor(.black, for: .normal)
//                button.translatesAutoresizingMaskIntoConstraints = false
//                view.addSubview(button)
//                
//                let centerXAnchor: NSLayoutXAxisAnchor
//                if col < numberOfColumns / 2 {
//                    centerXAnchor = view.centerXAnchor
//                } else {
//                    centerXAnchor = view.centerXAnchor
//                }
//                
//                NSLayoutConstraint.activate([
//                    button.widthAnchor.constraint(equalToConstant: buttonWidth),
//                    button.heightAnchor.constraint(equalToConstant: buttonHeight),
//                    button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: CGFloat(row - numberOfRows / 2) * (buttonHeight + buttonSpacing)),
//                    button.centerXAnchor.constraint(equalTo: centerXAnchor, constant: col < numberOfColumns / 2 ? -buttonSpacing / 2 - buttonWidth / 2 : buttonSpacing / 2 + buttonWidth / 2),
//                ])
//            }
//        }
//    }
//}
