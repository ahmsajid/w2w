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

class SignInVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func FBButtonPressed(_ sender: Any) {
        
        //Checking with Facebook if everything is ok
        let facebookLogin = FBSDKLoginManager()
        facebookLogin.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if error != nil {
                print("Unable to authenticate with Facebook - \(error)" )
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
                    print("Unable to authtenticate with Firebase - \(error)")
                } else {
                    print("Successfully authtenticated with Firebase")
                }
            })
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

