//
//  MaterialTextField.swift
//  W2W
//
//  Created by A H M Masfiqur Rahman Sajid on 5/23/17.
//  Copyright © 2017 A H M Masfiqur Rahman Sajid. All rights reserved.
//

import UIKit

class MaterialTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        //MARK: setting up border
        layer.borderColor = UIColor(red: CGFloat(SHADOW_COLOR), green: CGFloat(SHADOW_COLOR), blue: CGFloat(SHADOW_COLOR), alpha: 0.6).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2.0
    }
    
    //MARK: PlaceHolder editing
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10, dy: 10)
    }
    
}
