//
//  NetworkService.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = Dictionary<String, Any>
typealias JSONList = [JSON]

class NetworkService {
    
    static let baseURL: String = "https://swapi.co/api"
    
    func load(url: String, completion: @escaping (_ json: JSON, _ status: NetworkStatus) -> Void) {
        if ReachabilityService.isConnectedToNetwork() {
            Alamofire.request(NetworkService.baseURL + url).responseJSON { (response) in
                if let json = response.result.value as? JSON {
                    completion(json, NetworkStatus.CONNECTED)
                }
            }
        } else {
            completion([:], NetworkStatus.NOT_CONNECTED)
        }
    }
}

enum NetworkStatus {
    case NOT_CONNECTED
    case CONNECTED
}
