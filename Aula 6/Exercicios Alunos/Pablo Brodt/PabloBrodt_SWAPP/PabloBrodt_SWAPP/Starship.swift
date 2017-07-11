//
//  Starship.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Starship: Searchable {
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
    
    func getDetailProperties() -> Dictionary<String, String> {
        return [
            "passengers" : self.passengers,
            "crew" : self.crew,
            "hd rating" : self.hyperdriveRating
        ]
    }
}
