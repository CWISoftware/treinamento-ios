//
//  Starships.swift
//  Aula6
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Starships {
    static func getMostAccessed(completion: @escaping (_ starship: [Starship]?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "starships/?page=1") { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                let apiResult = json?["results"] as! [JSON]
                var data = [Starship]()
                
                apiResult.forEach { jsonData in
                    data.append(Starship(json: jsonData))
                }
                
                completion(data, status)
            }
            else {
                completion(nil, status)
            }
        }
    }
    
    static func search(_ text: String, completion: @escaping (_ starship: [Starship]?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "starships/?search=" + text) { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                let apiResult = json?["results"] as! [JSON]
                var data = [Starship]()
                
                apiResult.forEach { jsonData in
                    data.append(Starship(json: jsonData))
                }
                
                completion(data, status)
            }
            else {
                completion(nil, status)
            }
        }
    }
}
