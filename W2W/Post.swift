//
//  Post.swift
//  W2W
//
//  Created by A H M Masfiqur Rahman Sajid on 5/31/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import Foundation

class Post {
    //storing the data
    private var _caption: String!
    private var _imageUrl: String!
    private var _likes: Int!
    private var _postKey: String! //post id
    
    var caption: String {
        return _caption
    }
    
    var imageUrl: String {
        return _imageUrl
    }
    
    var likes: Int {
        return _likes
    }
    
    var postKey: String {
        return _postKey
    }
    
    //MARK: Initilization
    
    //initilizing caption, imageurl and likes
    init(caption: String, imageUrl: String, likes: Int) {
        self._caption = caption
        self._imageUrl = imageUrl
        self._likes = likes
    }
    
    //initilization of postKey or Post ID. This will be used to convert the data
    //From Firebase
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        //Dictionary data can contain anything so we are taking precautions. Names but be exactly same as the Firebase Database JSON
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        
        if let imageUrl = postData["imageUrl"] as? String {
            self._imageUrl = imageUrl
        }
        
        if let likes = postData["likes"] as? Int {
            self._likes = likes
        }
    }
}








