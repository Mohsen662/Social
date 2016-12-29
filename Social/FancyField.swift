//
//  FancyField.swift
//  Social
//
//  Created by mohsen on 10/9/1395 AP.
//  Copyright © 1395 irswift. All rights reserved.
//

import UIKit

class FancyField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.borderColor = UIColor(red: SHADOW_GREY, green: SHADOW_GREY, blue: SHADOW_GREY, alpha: 0.2).cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = 2.0
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10.0, dy: 5.0)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.insetBy(dx: 10.0, dy: 5.0)
    }
}
