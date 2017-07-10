//
//  PeopleService.swift
//  SWAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class PeopleService {
    static func findByName(_ name: String, completion: @escaping (_ person: [People]?, _ error: Int) -> Void) {
        Network.load(url: "people/", parameters: ["search": name] ) { (json, error) in
            if error == 0 && json["count"] as! Int > 0 {
                completion(parseToModel(jsonResult: json["results"] as! [JSON] ), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func findAll(completion: @escaping (_ person: [People]?, _ error: Int) -> Void) {
        Network.load(url: "people/") { (json, error) in
            if error == 0 && json["count"] as! Int > 0 {
                completion(parseToModel(jsonResult: json["results"] as! [JSON] ), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func findById(_ id: Int, completion: @escaping (_ person: People?, _ error: Int) -> Void) {
        Network.load(url: "people/\(id)") { (json, error) in
            if json.count > 1 {
                completion(People(json: json ), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    private static func parseToModel(jsonResult: [JSON]) -> [People]? {
        var peoples = [People]()
        
        for var people in jsonResult {
            peoples.append(People(json: people))
        }
        
        return peoples
    }
}
