//
//  RegistrationViewController.swift
//  MyInstagram
//
//  Created by MAC on 22/11/2021.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController {
    
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
        
        userNameField.delegate = self
        userEmailField.delegate = self
        passwordfield.delegate = self
        confirmPasswordfield.delegate = self
        userNameField.becomeFirstResponder()
        
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        registerButton.addTarget(self, action: #selector(didTapRegisterButton), for: .touchUpInside)
    }
    
//    MARK: - UI DESIGN
    
    private let headerView : UIView = {
        let header = UIView()
        header.clipsToBounds = true
        let backgroundImage = UIImageView(image: UIImage(named: "gradient"))
        header.addSubview(backgroundImage)
        return header
    }()
    private let userNameLabel : UILabel = {
        let text = UILabel()
        text.text = " your name "
        text.textColor = .systemOrange
        text.sizeToFit()
        return text
    }()
    private let userNameField : UITextField = {
        let field = UITextField()
        field.placeholder = "Your Name "
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .next
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        field.layer.cornerRadius = constant.cornerRadius
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        return field
    }()
    
    private let userEmailLabel : UILabel = {
        let text = UILabel()
        text.text = " your Email "
        text.textColor = .systemOrange
        text.sizeToFit()
        return text
    }()
    
    private let userEmailField : UITextField = {
        let field = UITextField()
        field.placeholder = "Your Email"
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .next
        field.backgroundColor = .secondarySystemBackground
        field.isSecureTextEntry = false
        field.layer.masksToBounds = true
        field.layer.cornerRadius = constant.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return field
    }()
    
    private let PasswordLabel : UILabel = {
        let text = UILabel()
        text.text = " Your Password "
        text.textColor = .systemOrange
        text.sizeToFit()
        return text
    }()
    
    private let passwordfield : UITextField = {
        let field = UITextField()
        field.placeholder = "Password"
        field.isSecureTextEntry = true
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .next
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        field.layer.cornerRadius = constant.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return field
    }()
    
    private let confirmPasswordLabel : UILabel = {
        let text = UILabel()
        text.text = "Confirm Password"
        text.textColor = .systemOrange
        text.sizeToFit()
        return text
    }()
    
    private let confirmPasswordfield : UITextField = {
        let field = UITextField()
        field.placeholder = "Confirm Password"
        field.isSecureTextEntry = true
        field.autocorrectionType = .no
        field.autocapitalizationType = .none
        field.returnKeyType = .next
        field.backgroundColor = .secondarySystemBackground
        field.layer.masksToBounds = true
        field.layer.cornerRadius = constant.cornerRadius
        field.layer.borderWidth = 1.0
        field.layer.borderColor = UIColor.secondaryLabel.cgColor
        field.leftViewMode = .always
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        return field
    }()
    
    private let registerButton : UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.white , for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.masksToBounds = true
        button.layer.cornerRadius = constant.cornerRadius
        return button
    }()
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.frame = CGRect(
            x: 0,
            y: 0,
            width: view.width,
            height: view.height/3)
        userNameLabel.frame = CGRect(
            x: constant.xStart,
            y: headerView.bottom,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        userNameField.frame = CGRect(
            x: constant.xStart,
            y: userNameLabel.bottom,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        userEmailLabel.frame = CGRect(
            x: constant.xStart,
            y: userNameField.bottom,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        userEmailField.frame = CGRect(
            x: constant.xStart,
            y: userEmailLabel.bottom,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        PasswordLabel.frame = CGRect(
            x: constant.xStart,
            y: userEmailField.bottom,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        passwordfield.frame = CGRect(
            x: constant.xStart,
            y: PasswordLabel.bottom,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        confirmPasswordLabel.frame = CGRect(
            x: constant.xStart,
            y: passwordfield.bottom,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        confirmPasswordfield.frame = CGRect(
            x: constant.xStart,
            y: confirmPasswordLabel.bottom,
            width: view.width - view.width/constant.widthDevide,
            height: constant.height)
        registerButton .frame = CGRect(
            x: view.width/4.0,
            y: confirmPasswordfield.bottom + constant.space,
            width: view.width/2.0,
            height: constant.height)
        
        configureHeaderView()
        
    }
    
    private func addSubViews(){
        view.addSubview(headerView)
        view.addSubview(userNameLabel)
        view.addSubview(userNameField)
        view.addSubview(userEmailLabel)
        view.addSubview(userEmailField)
        view.addSubview(PasswordLabel)
        view.addSubview(passwordfield)
        view.addSubview(confirmPasswordLabel)
        view.addSubview(confirmPasswordfield)
        view.addSubview(registerButton)
    }
    
    private func configureHeaderView (){
        guard headerView.subviews.count == 1 else {
            return
        }
        guard let backgroundView = headerView.subviews.first else {
            return
        }
        
        backgroundView.frame = headerView.bounds
        let imageView = UIImageView(image: UIImage(named: "text"))
        imageView.contentMode = .scaleAspectFit
        headerView.addSubview(imageView)
        imageView.frame = CGRect(x: headerView.width/4, y: view.safeAreaInsets.top, width: headerView.width/2, height:headerView.height - view.safeAreaInsets.top)
    }
    
    @objc private func didTapRegisterButton(){
        
        if passwordfield.text == confirmPasswordfield.text {
            guard let userName = userNameField.text, let email = userEmailField.text,
                  let password = passwordfield.text else{
                      return
                  }
            AuthManager.shared.registerNewUser(email: email, userName: userName, password: password) { success,errorText  in
                DispatchQueue.main.async {
                    if success {
                        self.dismiss(animated: true, completion: nil)
                    }
                    else{
                        let alert = UIAlertController(title: "Alert!", message: errorText, preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "Try Again", style: .cancel))
                        self.present(alert, animated: true, completion: nil)
                    }
                }
            }
        }
        else{
            let alert = UIAlertController(title: "Error", message: "password not the same", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "try Again", style: .cancel))
            present(alert, animated: true, completion: nil)
            
            passwordfield.text = nil
            confirmPasswordfield.text = nil
            passwordfield.becomeFirstResponder()
        }
    }

}

//MARK: - UITextFieldDelegate

extension RegistrationViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameField {
            userEmailField.becomeFirstResponder()
        }
        else if textField == userEmailField {
            passwordfield.becomeFirstResponder()
        }
        else if textField == passwordfield {
            confirmPasswordfield.becomeFirstResponder()
        }
        else if textField == confirmPasswordfield {
            didTapRegisterButton()
        }
        return true
    }
}

//let userName = userNameField.text, !userName.isEmpty,
//      let userEmail = userEmailField.text, userEmail.contains("@"), userEmail.contains("."),
//      let password = passwordfield.text,
