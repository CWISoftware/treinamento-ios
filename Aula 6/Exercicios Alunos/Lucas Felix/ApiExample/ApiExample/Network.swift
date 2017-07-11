//
//  Netword.swift
//  ApiExample
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = Dictionary<String, Any>
typealias JSONArray = Dictionary<String, [Any]>

class Network {
    
    static let baseURL = "https://swapi.co/api/"
    
    class func load(url: String, method: HTTPMethod = .get, completion: @escaping (_ json: JSON, _ error: Int) -> Void) {
        if Reachability.isConnectedToNetwork() {
            Alamofire.request(Network.baseURL + url, method: method).responseJSON { (response) in
                if response.deuBoa {
                    if let json = response.result.value as? JSON {
                        completion(json, 0)
                    }
                } else {
                    completion([:], 2)
                }
            }
        } else {
            completion([:], 1)
        }
    }
    
}
