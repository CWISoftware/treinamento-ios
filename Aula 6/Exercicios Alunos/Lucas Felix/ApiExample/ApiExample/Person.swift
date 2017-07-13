//
//  Person.swift
//  ApiExample
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Person {
    
    var name: String
    var height : String
    var mass: String
    var hairColor: String
    
    init?(json: JSON) {
        self.name = json["name"] as! String
        self.height = json["height"] as! String
        self.mass = json["mass"] as! String
        self.hairColor = json["hair_color"] as! String
    }
    
    static func getAll(completion: @escaping (_ person: [Person]?, _ error: Int) -> Void) {
        Network.load(url: "people/") { (json, error) in
            if error == 0 {
                var persons: [Person] = []
                for case let result in json["results"] as! [JSON] {
                    if let person = Person(json: result) {
                        persons.append(person)
                    }
                }
                completion(persons, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getPerson(_ id: Int, completion: @escaping (_ person: Person?, _ error: Int) -> Void) {
        Network.load(url: "people/\(id)") { (json, error) in
            if error == 0 {
                completion(Person(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
}
