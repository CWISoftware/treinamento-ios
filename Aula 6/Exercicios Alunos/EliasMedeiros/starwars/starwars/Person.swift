//
//  Person.swift
//  starwars
//
//  Created by InfraCWI on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Person {
    
    var name: String
    
    init(json: JSON) {
        self.name = json["name"] as! String
    }
    
    static func getPerson(_ id: Int, completion: @escaping (_ person: Person) -> Void) {
        Network.load(url: "people/\(id)") { (json) in
            completion(Person(json: json))
        }
        
    }
    
}
