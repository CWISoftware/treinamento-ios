//
//  Startship.swift
//  Aula6
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Starship {
    var name: String
    var passengers: Int
    var crew: Int
    var hdrating: Double
    
    init(json: JSON) {
        self.name = json["name"] as! String
        
        if let jsonPassengers = Int(json["passengers"] as! String) {
            self.passengers =  jsonPassengers
        }
        else
        {
            self.passengers = 0
        }
        
        if let jsonCrew = Int(json["crew"] as! String) {
            self.crew =  jsonCrew
        }
        else
        {
            self.crew = 0
        }
        
        if let jsonHdHeight = Double(json["hyperdrive_rating"] as! String) {
            self.hdrating =  jsonHdHeight
        }
        else
        {
            self.hdrating = 0
        }
    }
    
    static func getStarship(_ id: Int, completion: @escaping (_ person: Starship?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "starships/\(id)") { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                completion(Starship(json: json!), status)
            }
            else {
                completion(nil, status)
            }
        }
    }
}

