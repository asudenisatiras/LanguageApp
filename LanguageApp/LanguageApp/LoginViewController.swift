//
//  LoginViewController.swift
//  LanguageApp
//
//  Created by Ahmet Akgün on 26.10.2023.
//

import UIKit


class LoginViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "back"))
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
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 74/255, green: 55/255, blue: 128/255, alpha: 1)
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let createAccountButton: UIButton = {
        let button = UIButton(type: .system)
        
        let alreadyHaveAccountText = "Don't have an account?"
        
        let attributedText = NSMutableAttributedString(string: alreadyHaveAccountText)
        attributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.black, range: NSRange(location: 0, length: attributedText.length))
        
        attributedText.append(NSAttributedString(string: " ", attributes: [NSAttributedString.Key.kern: 1]))
        button.setAttributedTitle(attributedText, for: .normal)
        
        let loginNowText = "Create Account"
        let loginNowAttributedText = NSMutableAttributedString(string: loginNowText)
        
        loginNowAttributedText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(red: 91/255, green: 150/255, blue: 255/255, alpha: 1), range: NSRange(location: 0, length: loginNowAttributedText.length))
        loginNowAttributedText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: loginNowAttributedText.length))
        
        attributedText.append(loginNowAttributedText)
        
        button.setAttributedTitle(attributedText, for: .normal)
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
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 232/255, green: 236/255, blue: 244/255, alpha: 1).cgColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false

        let image = UIImage(named: "google")
        button.setImage(image, for: .normal)
        button.setTitle("Continue with Google", for: .normal)
        button.setTitleColor(.black, for: .normal)

        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0) // Image'ı sola kaydır

        return button
    }()
    

    private let facebookButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .white
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 232/255, green: 236/255, blue: 244/255, alpha: 1).cgColor
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false

        let image = UIImage(named: "facebook")
        button.setImage(image, for: .normal)
        
        button.setTitle("Continue with Facebook", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0) // Image'ı sola kaydır
        return button
    }()

    
    private lazy var fieldsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        googleButton.addTarget(self, action: #selector(googleLoginButtonTapped), for: .touchUpInside)
        facebookButton.addTarget(self, action: #selector(facebookLoginButtonTapped), for: .touchUpInside)
        createAccountButton.addTarget(self, action: #selector(openSignUpViewController), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(openForgotPasswordViewController), for: .touchUpInside)
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        view.backgroundColor = .white
        
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
        
        let divider = view.addDivider(withText: "or Login With" )
        view.addSubview(createAccountButton)
        view.addSubview(logoImageView)
        view.addSubview(fieldsStackView)
        view.addSubview(loginButton)
        view.addSubview(socialStackView)
        view.addSubview(forgotPasswordButton)
        socialStackView.addArrangedSubview(googleButton)
        socialStackView.addArrangedSubview(facebookButton)
        
        NSLayoutConstraint.activate([
            createAccountButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            createAccountButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            
            fieldsStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40),
            fieldsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            fieldsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            emailTextField.heightAnchor.constraint(equalToConstant: 52),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: fieldsStackView.bottomAnchor, constant: 10),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: fieldsStackView.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            loginButton.heightAnchor.constraint(equalToConstant: 52),
            
            divider.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            
            socialStackView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 20),
            socialStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            socialStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            googleButton.heightAnchor.constraint(equalToConstant: 50),
            facebookButton.heightAnchor.constraint(equalToConstant: 50),
            
        ])
    }
    
    @objc private func loginButtonTapped() {
        let homeViewController = HomeViewController()
        homeViewController.modalPresentationStyle = .fullScreen
        present(homeViewController, animated: true, completion: nil)
        
    }
    @objc private func googleLoginButtonTapped() {
      
        }
 
    @objc private func facebookLoginButtonTapped() {
   
        
    }
    
    private func openMainViewController() {
        let homeViewController = HomeViewController()
        homeViewController.modalPresentationStyle = .fullScreen
        present(homeViewController, animated: true, completion: nil)
    }
    @objc private func openForgotPasswordViewController() {
        let forgotPasswordViewController = ForgotPasswordViewController()
        let navigationController = UINavigationController(rootViewController: forgotPasswordViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc private func openSignUpViewController() {
        let signUpViewController = SignupViewController()
        let navigationController = UINavigationController(rootViewController: signUpViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}


