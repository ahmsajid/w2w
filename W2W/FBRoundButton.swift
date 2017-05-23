//
//  FBRoundButton.swift
//  W2W
//
//  Created by A H M Masfiqur Rahman Sajid on 5/23/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import UIKit

class FBRoundButton: UIButton {

    override func awakeFromNib() {
        super.awakeFromNib()
        layer.shadowColor = UIColor(red: CGFloat(SHADOW_COLOR), green: CGFloat(SHADOW_COLOR), blue: CGFloat(SHADOW_COLOR), alpha: 0.6).cgColor
        layer.cornerRadius = 5.0
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = self.frame.width / 2
    }
}
