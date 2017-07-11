//
//  People.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class People: Searchable {
    var name: String
    var height: String
    var mass: String
    var hairColor: String
    
    init(json: JSON) {
        self.name = json["name"] as! String
        self.height = json["height"] as! String
        self.mass = json["mass"] as! String
        self.hairColor = json["hair_color"] as! String
    }
    
    func getDetailProperties() -> Dictionary<String, String> {
        return [
            "height" : self.height,
            "mass" : self.mass,
            "hair color" : self.hairColor
        ]
    }
}
