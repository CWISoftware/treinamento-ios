//
//  Network.swift
//  starwars
//
//  Created by InfraCWI on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = Dictionary<String, Any>

class Network {
    
    static let baseURL = "https://swapi.co/api/"
    
    class func load(url: String, method: HTTPMethod = .get, params: [String: Any] = [:], completion: @escaping (_ json: JSON) -> Void) {
        
        Alamofire.request(self.baseURL + url, method: method, parameters: params).responseJSON { (response) in
            
            if let json = response.result.value as? JSON {
                completion(json)
            }
            
        }
    }
}
