//
//  ForgotPasswordViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "forgotPassword")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your email"
        textField.textColor = .black
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
 
    private let sendCodeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up" , for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 74/255, green: 55/255, blue: 128/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let loginNowButton: UIButton = {
        let button = UIButton(type: .system)
        
        let alreadyHaveAccountText = "Remember Password?"
        
        let attributedText = NSMutableAttributedString(string: alreadyHaveAccountText)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: attributedText.length))
        
        attributedText.append(NSAttributedString(string: " ", attributes: [NSAttributedString.Key.kern: 1]))
        button.setAttributedTitle(attributedText, for: .normal)
 
        let loginNowText = "Login"
        let loginNowAttributedText = NSMutableAttributedString(string: loginNowText)
        
        loginNowAttributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 91/255, green: 150/255, blue: 255/255, alpha: 1), range: NSRange(location: 0, length: loginNowAttributedText.length))
        loginNowAttributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: loginNowAttributedText.length))
        
        attributedText.append(loginNowAttributedText)
        
        button.setAttributedTitle(attributedText, for: .normal)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var fieldsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,
                                                       ])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI()
        
        sendCodeButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backButtonTapped))
        backButton.tintColor = .systemIndigo
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    private func setupUI() {
        view.addSubview(logoImageView)
        view.addSubview(fieldsStackView)
        view.addSubview(sendCodeButton)
        view.addSubview(loginNowButton)
   
        
        let textFieldBackgroundColor = UIColor(white: 0.95, alpha: 1.0)
        let textFieldBorderColor = UIColor.clear.cgColor
        
        emailTextField.layer.borderWidth = 1.0
        emailTextField.layer.borderColor = textFieldBorderColor
        emailTextField.backgroundColor = textFieldBackgroundColor
        emailTextField.layer.cornerRadius = 8
        emailTextField.clipsToBounds = true
        emailTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailTextField.frame.height))
        emailTextField.leftViewMode = .always
        emailTextField.font = UIFont(name: "Helvetica-Oblique", size: 15)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fieldsStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 36),
            fieldsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            fieldsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
         
            sendCodeButton.topAnchor.constraint(equalTo: fieldsStackView.bottomAnchor, constant: 40),
            sendCodeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            sendCodeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            sendCodeButton.heightAnchor.constraint(equalToConstant: 52),
            
            loginNowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            loginNowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc private func signupButtonTapped() {
      
    }
    

    
}

