//
//  FeedPostCell.swift
//  W2W
//
//  Created by A H M Masfiqur Rahman Sajid on 5/27/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import UIKit

class FeedPostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var usernameLable: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var caption: UITextView!
    @IBOutlet weak var numberOfLikeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
}
