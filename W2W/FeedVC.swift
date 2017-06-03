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
    
    //saving post data in an array
    var posts = [Post]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        //this gets the data from Firebase Database
        DataService.ds.REF_POSTS.observe(.value, with: {(snapshot) in
            //breaking it into individual objects
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                //once we are there, we will get each individual snapshot
                for snap in snapshot {
                    print("\(snap)")
                    //snap value can be cast as a Dictionary
                    if let postDictionary = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(postKey: key, postData: postDictionary)
                        //passing the post variable 
                        self.posts.append(post)
                    }
                }
            }
            self.tableView.reloadData()
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
        
        let post = posts[indexPath.row]
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "postFeedCell") as? FeedPostCell {
            cell.configureCell(post: post)
            return cell
        } else {
            return FeedPostCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
