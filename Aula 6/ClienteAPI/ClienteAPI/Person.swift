//
//  Person.swift
//  ClienteAPI
//
//  Created by Juliano Krieger Nardon on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Person {
    
    var name: String
    var birthYear : String
    var eyeColor: String
    
    init(json: JSON) {
        self.name = json["name"] as! String
        self.birthYear = json["birth_year"] as! String
        self.eyeColor = json["eye_color"] as! String
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
