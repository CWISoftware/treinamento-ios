//
//  GradientView.swift
//  StarWarsApp
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import UIKit
import Foundation

class Colors {
    var gl:CAGradientLayer!
    
    init() {
        let colorLeft = UIColor(red: 250.0 / 255.0, green: 80.0 / 255.0, blue: 140.0 / 255.0, alpha: 1.0).cgColor
        let colorRight = UIColor(red: 255.0 / 255.0, green: 200.0 / 255.0, blue: 110.0 / 255.0, alpha: 1.0).cgColor
        
        self.gl = CAGradientLayer()
        self.gl.colors = [colorLeft, colorRight]
        self.gl.startPoint = CGPoint(x: 0.0, y: 0.0)
        self.gl.endPoint = CGPoint(x: 1.0, y: 0.0)
    }
}
