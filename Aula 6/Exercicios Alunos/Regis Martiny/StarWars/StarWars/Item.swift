//
//  DetailPage.swift
//  StarWars
//
//  Created by InfraCWI on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class Item {
    
    var name = String()
    var image = String()
    var leftPropertyName = String()
    var centerPropertyName = String()
    var rightPropertyName = String()
    var leftPropertyValue = String()
    var centerPropertyValue = String()
    var rightPropertyValue = String()
    
    init() {
        
    }
    
    init(image: String, name: String, leftPropertyName: String, leftPropertyValue: String, centerPropertyName: String, centerPropertyValue: String, rightPropertyName: String, rightPropertyValue: String) {
        self.image = image
        self.name = name
        self.leftPropertyName = leftPropertyName
        self.leftPropertyValue = leftPropertyValue
        self.centerPropertyName = centerPropertyName
        self.centerPropertyValue = centerPropertyValue
        self.rightPropertyName = rightPropertyName
        self.rightPropertyValue = rightPropertyValue
    }
}
