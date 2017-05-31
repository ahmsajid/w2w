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

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //this gets the data from Firebase Database
        DataService.ds.REF_POSTS.observe(.value, with: {(snapshot) in
            print(snapshot.value)
        })
    }
    
    //MARK: Signout function
    @IBAction func SignOutBtnPressed(_ sender: Any) {
        let keyChainRemove = KeychainWrapper.standard.removeObject(forKey: KEY_UID)
        print("ID removed from keychainwrapper \(keyChainRemove)")
        try! FIRAuth.auth()?.signOut()
        performSegue(withIdentifier: "goToSignInPage", sender: nil)
    }
    
    //MARK: TableView Datasource and Delegates
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "postFeedCell") as! FeedPostCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
}
