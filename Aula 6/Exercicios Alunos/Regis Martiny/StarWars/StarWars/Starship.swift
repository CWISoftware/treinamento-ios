//
//  Starship.swift
//  StarWars
//
//  Created by InfraCWI on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class Starship : Item {
    var passengers: String
    var crew: String
    var hdRating: String
    
    init(json: JSON) {
        let image = ""
        let name = json["name"] as! String
        self.passengers = json["passengers"] as! String
        self.crew = json["crew"] as! String
        self.hdRating = json["hyperdrive_rating"] as! String
        
        super.init(image: image, name: name, leftPropertyName: "PASSENGERS", leftPropertyValue: self.passengers, centerPropertyName: "CREW", centerPropertyValue: self.crew, rightPropertyName: "HD RATING", rightPropertyValue: self.hdRating)
    }
    
    static func getStarship(_ id: Int, completion: @escaping (_ starship: Starship?, _ error: Int) -> Void) {
        Network.load(url: "starship/\(id)") { (json, error) in
            if error == 0 {
                completion(Starship(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getStarship(_ name: String, completion: @escaping (_ starship: Starship?, _ error: Int) -> Void) {
        Network.load(url: "starships/?search=\(name)") { (json, error) in
            if error == 0 {
                completion(Starship(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getStarships(_ name: String, completion: @escaping (_ starship: [Starship]?, _ error: Int) -> Void) {
        Network.load(url: "starships/?search=\(name)") { (json, error) in
            
            var starships = [Starship]()
            
            if let results = json["results"] as? [JSON] {
                for starship in results {
                    starships.append(Starship(json: starship))
                }
            }
            
            if error == 0 {
                completion(starships, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getAll(completion: @escaping (_ starship: [Starship]?, _ error: Int) -> Void) {
        Network.load(url: "starships") { (json, error) in
            
            var starships = [Starship]()
            
            if let results = json["results"] as? [JSON] {
                for starship in results {
                    starships.append(Starship(json: starship))
                }
            }
            
            if error == 0 {
                completion(starships, error)
            } else {
                completion(nil, error)
            }
        }
    }
}
