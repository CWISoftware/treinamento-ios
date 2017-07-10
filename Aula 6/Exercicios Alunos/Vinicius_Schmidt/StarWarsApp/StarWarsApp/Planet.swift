//
//  Person.swift
//  ClientAPI
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
    
    init(json: JSON) {
        self.name = json["name"] as! String
        self.rotationPeriod = json["rotation_period"] as! String
        self.diameter = json["diameter"] as! String
        self.surfaceWater = json["surface_water"] as! String
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
    
    static func getPlanetByName(_ name: String, completion: @escaping (_ planet: Planet?, _ error: Int) -> Void) {
        Network.load(url: "planets/?search=\(name)") { (json, error) in
            if error == 0 {
                
                if let results = json["results"] as? [JSON] {
                    if results.count > 0 {
                        completion(Planet(json: results[0]), error)
                    }
                } else {
                    completion(nil, 74)
                }
            } else {
                completion(nil, error)
            }
            
        }
    }
    
    static func getPlanetsByName(_ name: String, completion: @escaping (_ planets: [Planet]?, _ error: Int) -> Void) {
        Network.load(url: "planets?search=\(name)") { (json, error) in
            if error == 0 {
                var planets = [Planet]()
                
                if let results = json["results"] as? [JSON] {
                    for planet in results {
                        planets.append(Planet(json: planet))
                    }
                } else {
                    completion(nil, 74)
                }
                
                completion(planets, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getPlanets(completion: @escaping (_ planets: [Planet]?, _ error: Int) -> Void) {
        Network.load(url: "planets") { (json, error) in
            if error == 0 {
                var planets = [Planet]()
                
                if let results = json["results"] as? [JSON] {
                    for planet in results {
                        planets.append(Planet(json: planet))
                    }
                } else {
                    completion(nil, 74)
                }
                
                completion(planets, error)
            } else {
                completion(nil, error)
            }
        }
    }
}
