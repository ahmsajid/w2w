//
//  FeedViewController.swift
//  W2W
//
//  Created by A H M Masfiqur Rahman Sajid on 5/25/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class FeedVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func SignOutBtnPressed(_ sender: Any) {
        let keyChainRemove = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("ID removed from keychainwrapper \(keyChainRemove)")
        
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignInPage", sender: nil)
    }
}
