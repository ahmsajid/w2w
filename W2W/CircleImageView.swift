//
//  CircleImageView.swift
//  W2W
//
//  Created by A H M Masfiqur Rahman Sajid on 5/26/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import UIKit

class CircleImageView: UIImageView {
    
    override func layoutSubviews() {
    
        layer.cornerRadius = self.frame.width / 2
        //clipsToBounds = true
    }
}
