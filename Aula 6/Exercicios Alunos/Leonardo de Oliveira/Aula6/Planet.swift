//
//  Planet.swift
//  Aula6
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Planet {
    var name: String
    var rotationPeriod: Int
    var diameter: Int
    var surfaceWater: Int
    
    init(json: JSON) {
        self.name = json["name"] as! String
        
        if let jsonRotationPeriod = Int(json["rotation_period"] as! String) {
            self.rotationPeriod =  jsonRotationPeriod
        }
        else
        {
            self.rotationPeriod = 0
        }
        
        if let jsonDiameter = Int(json["diameter"] as! String) {
            self.diameter =  jsonDiameter
        }
        else
        {
            self.diameter = 0
        }
        
        if let jsonSurfaceWater = Int(json["surface_water"] as! String) {
            self.surfaceWater =  jsonSurfaceWater
        }
        else
        {
            self.surfaceWater = 0
        }
    }
    
    static func getPlanet(_ id: Int, completion: @escaping (_ planet: Planet?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "starships/\(id)") { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                completion(Planet(json: json!), status)
            }
            else {
                completion(nil, status)
            }
        }
    }
}
