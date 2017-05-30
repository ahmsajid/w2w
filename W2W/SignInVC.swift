//
//  ViewController.swift
//  W2W
//
//  Created by A H M Masfiqur Rahman Sajid on 5/21/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import Firebase
import SwiftKeychainWrapper

class SignInVC: UIViewController {

    
    @IBOutlet weak var emailTextField: MaterialTextField!
    @IBOutlet weak var passwordTextField: MaterialTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //check if key exist, then retrieve it
        if let _ = KeychainWrapper.standard.string(forKey: KEY_UID) {
            performSegue(withIdentifier: "goToFeed", sender: nil)
        }
    }
    
    @IBAction func FBButtonPressed(_ sender: Any) {
        //Checking with Facebook if everything is ok
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Unable to authenticate with Facebook - \(String(describing: error))" )
            } else if result?.isCancelled == true {
                print("User canceled facebook authtectication")
            } else {
                print("Successfully authenticated with Facebook.")
                //credential to authenticate with Firebase
                let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                firebaseAuth(credential)
            }
        }
    
        func firebaseAuth(_ credential: FIRAuthCredential) {
            FIRAuth.auth()?.signIn(with: credential, completion: { (user, error) in
                if error != nil {
                    print("Unable to authtenticate with Firebase - \(String(describing: error))")
                } else {
                    print("Successfully authtenticated with Firebase")
                    //For auto-sign-in
                    if let user = user {
                        let userData = ["provider": credential.provider]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                    
                }
            })
        }
    }
    
    //MARK: EMAIL Sign-in Button
    @IBAction func emailSignInBtnPressed(_ sender: Any) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                    print("Email authenticated with Firebase")
                    if let user = user {
                        let userData = ["provider": user.providerID]
                        self.completeSignIn(id: user.uid, userData: userData)
                    }
                } else {
                    FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user, error) in
                        if error != nil {
                            print("Unable to authenticate with Firebase using email or password.")
                        } else {
                            print("Successfully authenticated with email.")
                            if let user = user {
                                let userData = ["provider": user.providerID]
                                self.completeSignIn(id: user.uid, userData: userData)
                            }
                        }
                    })
                }
            })
        }
    }
    
    func completeSignIn(id: String, userData: Dictionary<String, String>) {
        DataService.ds.createFirebaseDBUser(uid: id, userData: userData)
        let keychainResult = KeychainWrapper.standard.set(id, forKey: KEY_UID)
        print("Data saved to Keychain: \(keychainResult)")
        performSegue(withIdentifier: "goToFeed", sender: nil)
    }
}

