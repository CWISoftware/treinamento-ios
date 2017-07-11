//
//  Starship.swift
//  ApiExample
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Starship {
    
    var name: String
    var passengers: String
    var crew: String
    var hdRating: String
    
    init(json: JSON) {
        self.name = json["name"] as! String
        self.passengers = json["passengers"] as! String
        self.crew = json["crew"] as! String
        self.hdRating = json["hyperdrive_rating"] as! String
    }
    
    
    static func getStarship(_ id: Int, completion: @escaping (_ starship: Starship?, _ error: Int) -> Void) {
        Network.load(url: "starships/\(id)") { (json, error) in
            if error == 0 {
                completion(Starship(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
}
