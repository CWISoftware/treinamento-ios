//
//  Person.swift
//  Aula6
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var hairColor: String
    var height: Double
    var mass: Int
    
    init(json: JSON ) {
        self.name = json["name"] as! String
        
        if let jsonHeight = Double(json["height"] as! String) {
            self.height =  jsonHeight
        }
        else
        {
            self.height = 0
        }
        
        if let jsonMass = Int(json["mass"] as! String) {
            self.mass =  jsonMass
        }
        else
        {
            self.mass = 0
        }
        
        self.hairColor = json["hair_color"]  as! String
    }
    
    static func getPerson(_ id: Int, completion: @escaping (_ person: Person?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "people/\(id)") { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                completion(Person(json: json!), status)
            }
            else {
                completion(nil, status)
            }
        }
    }
}

