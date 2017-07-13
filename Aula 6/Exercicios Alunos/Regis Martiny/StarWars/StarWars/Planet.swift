//
//  Planet.swift
//  StarWars
//
//  Created by InfraCWI on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import UIKit

class Planet : Item {
    var rotationPeriod: String
    var diameter: String
    var surfaceWater: String
    
    init(json: JSON) {
        let image = UIImage()
        let name = json["name"] as! String
        self.rotationPeriod = json["rotation_period"] as! String
        self.diameter = json["diameter"] as! String
        self.surfaceWater = json["surface_water"] as! String
        
        super.init(image: image, name: name, leftPropertyName: "ROTATION PERIOD", leftPropertyValue: self.rotationPeriod, centerPropertyName: "DIAMETER", centerPropertyValue: self.diameter, rightPropertyName: "SURFACE WATER", rightPropertyValue: self.surfaceWater)
    }
    
    init(image: UIImage, name: String, rotationPeriod: String, diameter: String, surfaceWater: String) {
        self.rotationPeriod = rotationPeriod
        self.diameter = diameter
        self.surfaceWater = surfaceWater
        
        super.init(image: image, name: name, leftPropertyName: "PASSENGERS", leftPropertyValue: self.rotationPeriod, centerPropertyName: "CREW", centerPropertyValue: self.diameter, rightPropertyName: "HD RATING", rightPropertyValue: self.surfaceWater)
        
    }

    
    static func getPlanet(_ id: Int, completion: @escaping (_ planet: Planet?, _ error: Int) -> Void) {
        Network.load(url: "planets/\(id)") { (json, error) in
            if error == 0 {
                completion(Planet(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getPlanet(_ name: String, completion: @escaping (_ planet: Planet?, _ error: Int) -> Void) {
        Network.load(url: "planets/?search=\(name)") { (json, error) in
            if error == 0 {
                completion(Planet(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getPlanets(_ name: String, completion: @escaping (_ planet: [Planet]?, _ error: Int) -> Void) {
        Network.load(url: "planets/?search=\(name)") { (json, error) in
            
            var planets = [Planet]()
            
            if let results = json["results"] as? [JSON] {
                for planet in results {
                    planets.append(Planet(json: planet))
                }
            }
            
            if error == 0 {
                completion(planets, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getAll(completion: @escaping (_ planet: [Planet]?, _ error: Int) -> Void) {
        Network.load(url: "planets") { (json, error) in
            
            var planets = [Planet]()
            
            if let results = json["results"] as? [JSON] {
                for planet in results {
                    planets.append(Planet(json: planet))
                }
            }
            
            if error == 0 {
                completion(planets, error)
            } else {
                completion(nil, error)
            }
        }
    }
}
