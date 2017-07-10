//
//  Person.swift
//  ClientAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var mass: String
    var birthYear: String
    var eyeColor: String
    
    init(json: JSON) {
        self.name = json["name"] as! String
        self.mass = json["mass"] as! String
        self.birthYear = json["birth_year"] as! String
        self.eyeColor = json["eye_color"] as! String
    }
    
    /*init() {
        name = ""
        mass = ""
        birthYear = ""
        eyeColor = ""
    }*/
    
    static func getPerson(_ id: Int, completion: @escaping (_ person: Person?, _ error: Int) -> Void) {
        Network.load(url: "people/\(id)") { (json, error) in
            if error == 0 {
                completion(Person(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getPersonByName(_ name: String, completion: @escaping (_ person: Person?, _ error: Int) -> Void) {
        Network.load(url: "people/?search=\(name)") { (json, error) in
            if error == 0 {
                
                if let results = json["results"] as? [JSON] {
                    if results.count > 0 {
                        completion(Person(json: results[0]), error)
                    }
                } else {
                    completion(nil, 74)
                }
            } else {
                completion(nil, error)
            }
            
        }
    }
    
    static func getPeopleByName(_ name: String, completion: @escaping (_ people: [Person]?, _ error: Int) -> Void) {
        Network.load(url: "people?search=\(name)") { (json, error) in
            if error == 0 {
                var people = [Person]()
                
                if let results = json["results"] as? [JSON] {
                    for person in results {
                        people.append(Person(json: person))
                    }
                } else {
                    completion(nil, 74)
                }
                
                completion(people, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getPeople(completion: @escaping (_ people: [Person]?, _ error: Int) -> Void) {
        Network.load(url: "people") { (json, error) in
            if error == 0 {
                var people = [Person]()
                
                if let results = json["results"] as? [JSON] {
                    for person in results {
                        people.append(Person(json: person))
                    }
                } else {
                    completion(nil, 74)
                }
                
                completion(people, error)
            } else {
                completion(nil, error)
            }
        }
    }
}
