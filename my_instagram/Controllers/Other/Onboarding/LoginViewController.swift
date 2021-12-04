//
//  LoginViewController.swift
//  MyInstagram
//
//  Created by MAC on 22/11/2021.
//

import UIKit
import SafariServices

class LoginViewController: UIViewController {
    struct constant {
        static let cornerRadius = 9.0
        static let xStart = 25.0
        static let height = 52.0
        static let widthDevide = 8.0
        // space between views
        static let space = 10.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        // to use enter button in keyboard
        userNameEmailField.delegate = self
        passwordField.delegate = self
        
        userNameEmailField.becomeFirstResponder()
        
        view.backgroundColor = .systemBackground
        // add action to button
        loginButton.addTarget(self,
                           action: #selector(didTapLoginButton),
                           for: .touchUpInside)
        createAccountButton.addTarget(self,
                           action: #selector(didTapCreateAccountButton),
                           for: .touchUpInside)
        privacyButton.addTarget(self,
                           action: #selector(didTapPrivacyButton),
                           for: .touchUpInside)
        termsButton.addTarget(self,
                           action: #selector(didTapTermsButton),
                           for: .touchUpInside)
    }

//MARK: - ui design
     
    private let userNameEmailField : UITextField = {
        let field = UITextField()
        field.isSecureTextEntry = false
        field.placeholder = "name or email..."
        // enter key in keyboard in phone "next"
        field.returnKeyType = .next
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        field.layer.cornerRadius = constant.cornerRadius
        // show line around textField
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        
        return field
    }()
    private let passwordField : UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        // enter key in keyboard in phone "continue"
        field.returnKeyType = .continue
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        field.layer.cornerRadius = constant.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = constant.cornerRadius
        button.backgroundColor = .systemBlue
        return button
    }()
    private let createAccountButton : UIButton = {
        let button = UIButton()
        button.setTitle("New user? Create Account", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = constant.cornerRadius
        return button
    }()
    private let termsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Terms of service", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = constant.cornerRadius
        return button
    }()
    private let privacyButton : UIButton = {
        let button = UIButton()
        button.setTitle("Privacy polcy", for: .normal)
        button.setTitleColor(.secondaryLabel, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = constant.cornerRadius
        return button
    }()
    private let headerView : UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImage = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImage)
        return header
    }()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.width,
            height: view.height/3.0)
        
        userNameEmailField.frame = CGRect(
            x: constant.xStart,
            y: headerView.bottom + constant.space,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        
        passwordField.frame = CGRect(
            x: constant.xStart,
            y: userNameEmailField.bottom + constant.space,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        
        loginButton.frame = CGRect(
            x: constant.xStart,
            y: passwordField.bottom + constant.space,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        
        createAccountButton.frame = CGRect(
            x: constant.xStart,
            y: loginButton.bottom + constant.space,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        
        privacyButton.frame = CGRect(
            x: constant.xStart,
            y: view.height - view.safeAreaInsets.bottom - 2 * constant.height ,
            width: view.width - view.width/constant.widthDevide ,
            height: constant.height)
        
        termsButton.frame = CGRect(
            x: constant.xStart,
            y: view.height - view.safeAreaInsets.bottom - constant.height - constant.space,
            width: view.width - view.width/constant.widthDevide ,
            height: constant.height)
        
        configureHeaderView()
    }
    
    private func configureHeaderView() {
        guard headerView.subviews.count == 1 else{
            return
        }
        guard let backgroundView = headerView.subviews.first else{
            return
        }
        // to show in all header area
        backgroundView.frame = headerView.bounds
        let imageView = UIImageView(image: UIImage(named: "text"))
        headerView.addSubview(imageView)
        imageView.contentMode = .scaleAspectFit
        imageView.frame = CGRect(x: headerView.width/4, y: view.safeAreaInsets.top, width: headerView.width/2, height: headerView.height - view.safeAreaInsets.top)
    }
    
    private func addSubViews (){
        view.addSubview(userNameEmailField)
        view.addSubview(passwordField)
        view.addSubview(loginButton)
        view.addSubview(createAccountButton)
        view.addSubview(termsButton)
        view.addSubview(privacyButton)
        view.addSubview(headerView)
    }

    
    //MARK: - buttons actions
    
    @objc private func didTapLoginButton () {
    
        guard let userNameEmail = userNameEmailField.text, !userNameEmail.isEmpty,
            let password = passwordField.text else {
                return
        }
        
        var userName : String?
        var email : String?
        
        if userNameEmail.contains("@"),userNameEmail.contains("."){
            email = userNameEmail
            
        }else{
            userName = userNameEmail
        }
        
        AuthManager.shared.loginUser(email: email, userName: userName, password: password) { success in
            DispatchQueue.main.async {
                if success {
                    self.dismiss(animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Log In Error!", message: "We were unable to log you in", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        }
        // login function
    }
    
    @objc private func didTapCreateAccountButton () {
        let vc = RegistrationViewController()
        vc.title = "Create User"
        // create navigation programmatically
        let navigation = UINavigationController(rootViewController: vc)
        present(navigation, animated: false)
        
    }
    @objc private func didTapTermsButton () {
        guard let url = URL(string: "https://help.instagram.com/581066165581870/?helpref=hc_fnav") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: false)
        
    }
    @objc private func didTapPrivacyButton () {
        guard let url = URL(string: "https://help.instagram.com/519522125107875") else {
            return
        }
        let vc = SFSafariViewController(url: url)
        present(vc, animated: false)
    }
}

// MARK: -  UITextFieldDelegate
// to use enter in keyboard
extension LoginViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameEmailField {
            passwordField.becomeFirstResponder()
        }
        else if textField == passwordField {
            didTapLoginButton()
        }
        return true
    }
}
