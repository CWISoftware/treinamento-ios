//
//  GradientView.swift
//  StarWarsApp
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import Foundation

class GradientView : UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let colors = Colors()
        self.backgroundColor = UIColor.clear
        let backgroundLayer = colors.gl
        self.layoutIfNeeded()
        let screenSize: CGRect = UIScreen.main.bounds
        self.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: self.frame.height)
        backgroundLayer!.frame = self.frame
        self.layer.insertSublayer(backgroundLayer!, at: 0)
    }
    
}
