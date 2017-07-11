//
//  Film.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Film: Searchable {
    var name: String
    var episode: Int
    var releaseYear: String
    var director: String
    
    init(json: JSON) {
        self.name = json["title"] as! String
        self.episode = json["episode_id"] as! Int
        self.releaseYear = json["release_date"] as! String
        self.director = json["director"] as! String
    }
    
    func getDetailProperties() -> Dictionary<String, String> {
        return [
            "episode" : String(self.episode),
            "release year" : self.releaseYear,
            "director" : self.director
        ]
    }
}
