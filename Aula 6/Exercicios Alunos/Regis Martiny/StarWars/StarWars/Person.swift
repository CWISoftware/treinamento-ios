//
//  Person.swift
//  StarWars
//
//  Created by InfraCWI on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class Person : Item {
    var height = String()
    var mass = String()
    var hairColor = String()
    
    init(json: JSON) {
        let image = ""
        let name = json["name"] as! String
        self.height = json["height"] as! String
        self.mass = json["mass"] as! String
        self.hairColor = json["hair_color"] as! String
        
        super.init(image: image, name: name, leftPropertyName: "HEIGHT", leftPropertyValue: self.height, centerPropertyName: "MASS", centerPropertyValue: self.mass, rightPropertyName: "HAIR COLOR", rightPropertyValue: self.hairColor)
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
    
    static func getPerson(_ name: String, completion: @escaping (_ person: Person?, _ error: Int) -> Void) {
        Network.load(url: "people/?search=\(name)") { (json, error) in
            if error == 0 {
                completion(Person(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getPeople(_ name: String, completion: @escaping (_ person: [Person]?, _ error: Int) -> Void) {
        Network.load(url: "people/?search=\(name)") { (json, error) in
            
            var people = [Person]()
            
            if let results = json["results"] as? [JSON] {
                for person in results {
                    people.append(Person(json: person))
                }
            }
            
            if error == 0 {
                completion(people, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getAll(completion: @escaping (_ person: [Person]?, _ error: Int) -> Void) {
        Network.load(url: "people") { (json, error) in
            
            var people = [Person]()
            
            if let results = json["results"] as? [JSON] {
                for person in results {
                    people.append(Person(json: person))
                }
            }
            
            if error == 0 {
                completion(people, error)
            } else {
                completion(nil, error)
            }
        }
    }
}
