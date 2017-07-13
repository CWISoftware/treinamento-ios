//
//  Planet.swift
//  ApiExample
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Planet {
    
    var name: String
    var rotationPeriod: String
    var diameter: String
    var surfaceWater: String
    
    init?(json: JSON) {
        self.name = json["name"] as! String
        self.rotationPeriod = json["rotation_period"] as! String
        self.diameter = json["diameter"] as! String
        self.surfaceWater = json["surface_water"] as! String
    }
    
    
    static func getAll(completion: @escaping (_ planet: [Planet]?, _ error: Int) -> Void) {
        Network.load(url: "planets/") { (json, error) in
            if error == 0 {
                var planets: [Planet] = []
                for case let result in json["results"] as! [JSON] {
                    if let planet = Planet(json: result) {
                        planets.append(planet)
                    }
                }
                completion(planets, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getPlanet(_ id: Int, completion: @escaping (_ person: Planet?, _ error: Int) -> Void) {
        Network.load(url: "planets/\(id)") { (json, error) in
            if error == 0 {
                completion(Planet(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
}
