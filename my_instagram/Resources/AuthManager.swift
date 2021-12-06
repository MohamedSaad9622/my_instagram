//
//  AuthManager.swift
//  MyInstagram
//
//  Created by MAC on 23/11/2021.
//

import FirebaseAuth

// Authentication
public class AuthManager{
    
    static let shared = AuthManager()
    
    public func loginUser(email:String?,userName:String?,password:String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                guard result != nil , error == nil else {
                    completion(false)
                    return
                }
                completion(true)
                return
            }
        }
        else if let name = userName {
            print(name)
        }
    }
    
    
    public func registerNewUser(email:String, userName:String, password:String, completion: @escaping (Bool,String?) -> Void){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let e = error {
                completion(false,e.localizedDescription)
            }else{
                completion(true,nil)
            }
            
            return
        }
    }
    
    public func logout(completion : (Bool,String?) -> Void){
        do {
            try Auth.auth().signOut()
            completion(true, nil)
        } catch let signOutError as NSError {
            completion(false,"Error signing out: \(signOutError)")
            print("Error signing out: %@", signOutError)
        }
    }
}
