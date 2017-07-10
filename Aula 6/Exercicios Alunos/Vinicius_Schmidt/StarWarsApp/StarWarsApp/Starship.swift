//
//  Person.swift
//  ClientAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Starship {
    var name: String
    var passengers: String
    var crew: String
    var hyperdriveRating: String
    
    init(json: JSON) {
        self.name = json["name"] as! String
        self.passengers = json["passengers"] as! String
        self.crew = json["crew"] as! String
        self.hyperdriveRating = json["hyperdrive_rating"] as! String
    }
    
    //não funciona request por ID
    static func getStarship(_ id: Int, completion: @escaping (_ starship: Starship?, _ error: Int) -> Void) {
        Network.load(url: "starships/\(id)") { (json, error) in
            if error == 0 {
                completion(Starship(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getStarshipByName(_ name: String, completion: @escaping (_ starship: Starship?, _ error: Int) -> Void) {
        Network.load(url: "starships/?search=\(name)") { (json, error) in
            if error == 0 {
                
                if let results = json["results"] as? [JSON] {
                    if results.count > 0 {
                        completion(Starship(json: results[0]), error)
                    }
                } else {
                    completion(nil, 74)
                }
            } else {
                completion(nil, error)
            }
            
        }
    }
    
    static func getStarshipsByName(_ name: String, completion: @escaping (_ starships: [Starship]?, _ error: Int) -> Void) {
        Network.load(url: "starships?search=\(name)") { (json, error) in
            if error == 0 {
                var starships = [Starship]()
                
                if let results = json["results"] as? [JSON] {
                    for starship in results {
                        starships.append(Starship(json: starship))
                    }
                } else {
                    completion(nil, 74)
                }
                
                completion(starships, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getStarships(completion: @escaping (_ starships: [Starship]?, _ error: Int) -> Void) {
        Network.load(url: "starships") { (json, error) in
            if error == 0 {
                var starships = [Starship]()
                
                if let results = json["results"] as? [JSON] {
                    for starship in results {
                        starships.append(Starship(json: starship))
                    }
                } else {
                    completion(nil, 74)
                }
                
                completion(starships, error)
            } else {
                completion(nil, error)
            }
        }
    }
}
