//
//  Planets.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Planet: Searchable {
    var name: String
    var rotationPeriod: String
    var diameter: String
    var surfaceWater: String
    
    init(json: JSON) {
        self.name = json["name"] as! String
        self.rotationPeriod = json["rotation_period"] as! String
        self.diameter = json["diameter"] as! String
        self.surfaceWater = json["surface_water"] as! String
    }
    
    func getDetailProperties() -> Dictionary<String, String> {
        return [
            "rotation period" : self.rotationPeriod,
            "diameter" : self.diameter,
            "surface water" : self.surfaceWater
        ]
    }
}
