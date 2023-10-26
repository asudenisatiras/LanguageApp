//
//  SignupViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//


import UIKit

class SignupViewController: UIViewController {
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "signuptext")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email Adress"
        textField.textColor = .black
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let confirmPasswordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Confirm Password"
        textField.textColor = .black
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    private let signupButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up" , for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 74/255, green: 55/255, blue: 128/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let socialStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let googleButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "google"), for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 232/255, green: 236/255, blue: 244/255, alpha: 1).cgColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let facebookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "facebook"), for: .normal)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 232/255, green: 236/255, blue: 244/255, alpha: 1).cgColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private let loginNowButton: UIButton = {
        let button = UIButton(type: .system)
        
        let alreadyHaveAccountText = "Already have an account?"
        
        let attributedText = NSMutableAttributedString(string: alreadyHaveAccountText)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: attributedText.length))
        
        attributedText.append(NSAttributedString(string: " ", attributes: [NSAttributedString.Key.kern: 1]))
        button.setAttributedTitle(attributedText, for: .normal)
 
        let loginNowText = "Login Now"
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
                                                       passwordTextField,
                                                       confirmPasswordTextField])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupUI()
        
        signupButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
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
        view.addSubview(signupButton)
        view.addSubview(socialStackView)
        view.addSubview(loginNowButton)
        
        socialStackView.addArrangedSubview(googleButton)
        socialStackView.addArrangedSubview(facebookButton)
        
        
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
        
        passwordTextField.font = UIFont(name: "Helvetica-Oblique", size: 15)
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.borderColor = textFieldBorderColor
        passwordTextField.backgroundColor = textFieldBackgroundColor
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.clipsToBounds = true
        passwordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordTextField.frame.height))
        passwordTextField.leftViewMode = .always
        
        confirmPasswordTextField.font = UIFont(name: "Helvetica-Oblique", size: 15)
        confirmPasswordTextField.layer.borderWidth = 1.0
        confirmPasswordTextField.layer.borderColor = textFieldBorderColor
        confirmPasswordTextField.backgroundColor = textFieldBackgroundColor
        confirmPasswordTextField.layer.cornerRadius = 8
        confirmPasswordTextField.clipsToBounds = true
        confirmPasswordTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: confirmPasswordTextField.frame.height))
        confirmPasswordTextField.leftViewMode = .always
        
        let signupDivider = view.addDivider(withText: "or Sign Up With" )
        
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fieldsStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            fieldsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            fieldsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            confirmPasswordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            signupButton.topAnchor.constraint(equalTo: fieldsStackView.bottomAnchor, constant: 30),
            signupButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            signupButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            signupButton.heightAnchor.constraint(equalToConstant: 52),
            
            signupDivider.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 20),
            
            socialStackView.topAnchor.constraint(equalTo: signupDivider.bottomAnchor, constant: 20),
            socialStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            socialStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginNowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            loginNowButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    @objc private func signupButtonTapped() {
        
  openMainViewController()
    }
    
    private func openMainViewController() {
        let homeViewController = HomeViewController()
        homeViewController.modalPresentationStyle = .fullScreen
        present(homeViewController, animated: true, completion: nil)
    }
    
}
