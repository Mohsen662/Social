//
//  CircleView.swift
//  Social
//
//  Created by mohsen on 10/11/1395 AP.
//  Copyright © 1395 irswift. All rights reserved.
//

import UIKit

class CircleView: UIImageView {

    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
    }

}
