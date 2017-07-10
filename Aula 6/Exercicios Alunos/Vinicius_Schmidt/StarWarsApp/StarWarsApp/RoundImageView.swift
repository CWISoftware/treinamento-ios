//
//  RoundImageView.swift
//  StarWarsApp
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import UIKit

class RoundImageView: UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.layer.borderWidth = 3
        self.layer.masksToBounds = true
        self.layer.borderColor = UIColor(red:1.0, green:1.0, blue:1.0, alpha: 0.8).cgColor
    }
}
