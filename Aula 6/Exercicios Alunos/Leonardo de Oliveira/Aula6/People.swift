//
//  People.swift
//  Aula6
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct People {
    static func getMostAccessed(completion: @escaping (_ person: [Person]?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "people/?page=1") { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                let apiResult = json?["results"] as! [JSON]
                var peopleData = [Person]()
                
                apiResult.forEach { person in
                    peopleData.append(Person(json: person))
                }
                
                completion(peopleData, status)
            }
            else {
                completion(nil, status)
            }
        }
    }
    
    static func search(_ text: String, completion: @escaping (_ person: [Person]?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "people/?search=" + text) { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                let apiResult = json?["results"] as! [JSON]
                var peopleData = [Person]()
                
                apiResult.forEach { person in
                    peopleData.append(Person(json: person))
                }
                
                completion(peopleData, status)
            }
            else {
                completion(nil, status)
            }
        }
    }
}
