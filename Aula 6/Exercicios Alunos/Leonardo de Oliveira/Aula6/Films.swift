//
//  Films.swift
//  Aula6
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Films {
    static func getMostAccessed(completion: @escaping (_ film: [Film]?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "films/?page=1") { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                let apiResult = json?["results"] as! [JSON]
                var data = [Film]()
                
                apiResult.forEach { jsonData in
                    data.append(Film(json: jsonData))
                }
                
                completion(data, status)
            }
            else {
                completion(nil, status)
            }
        }
    }
    
    static func search(_ text: String, completion: @escaping (_ film: [Film]?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "films/?search=" + text) { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                let apiResult = json?["results"] as! [JSON]
                var data = [Film]()
                
                apiResult.forEach { jsonData in
                    data.append(Film(json: jsonData))
                }
                
                completion(data, status)
            }
            else {
                completion(nil, status)
            }
        }
    }
}
