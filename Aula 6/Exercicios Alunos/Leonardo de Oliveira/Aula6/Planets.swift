//
//  Planets.swift
//  Aula6
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Planets {
    static func getMostAccessed(completion: @escaping (_ planet: [Planet]?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "planets/?page=1") { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                let apiResult = json?["results"] as! [JSON]
                var data = [Planet]()
                
                apiResult.forEach { jsonData in
                    data.append(Planet(json: jsonData))
                }
                
                completion(data, status)
            }
            else {
                completion(nil, status)
            }
        }
    }
    
    static func search(_ text: String, completion: @escaping (_ planet: [Planet]?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "planets/?search=" + text) { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                let apiResult = json?["results"] as! [JSON]
                var data = [Planet]()
                
                apiResult.forEach { jsonData in
                    data.append(Planet(json: jsonData))
                }
                
                completion(data, status)
            }
            else {
                completion(nil, status)
            }
        }
    }
}
