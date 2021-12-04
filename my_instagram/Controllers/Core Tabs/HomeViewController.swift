//
//  ViewController.swift
//  MyInstagram
//
//  Created by MAC on 22/11/2021.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    override func viewDidAppear(_ animated: Bool) {
        HandleAuthentication()
    }

    // if the user has open this before go to home direct
    func HandleAuthentication() {
        if Auth.auth().currentUser != nil {
            print(Auth.auth().currentUser?.email)
        }else{
            let loginVc = LoginViewController()
            loginVc.modalPresentationStyle = .fullScreen
            present(loginVc, animated: false)
        }
    }
}

