//
//  Network.swift
//  Aula6
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import Alamofire

typealias JSON = Dictionary<String, Any>
        
enum HTTPStatusCodes: Int {
    // 100 Informational
    case Continue = 100
    // 200 Success
    case OK = 200
    case IMUsed = 226
    // 300 Redirection
    case MultipleChoices = 300
    // 400 Client Error
    case BadRequest = 400
    case MisdirectedRequest = 421
    case UpgradeRequired = 426
    case PreconditionRequired = 428
    case RequestHeaderFieldsTooLarge = 431
    case UnavailableForLegalReasons = 451
    // 500 Server Error
    case InternalServerError = 500
    case NotExtended = 510
    case NetworkUnavailable = 999
}

class Network {
    static let baseURL = "https://swapi.co/api/"
    
    class func load(url: String, method: HTTPMethod = .get, parameters: [String: Any] = [:], completion: @escaping (_ json: JSON?, _ status: HTTPStatusCodes) -> Void) {
        if (Utilities.isConnectedToNetwork() == false)
        {
            completion(nil, HTTPStatusCodes.NetworkUnavailable)
        }
        else {
            Alamofire
                .request(baseURL + url, method: method, parameters: parameters)
                .responseJSON { (response) in
                    if  let json = response.result.value as? JSON {
                        completion(json, HTTPStatusCodes.OK)
                    }
            }
        }
    }
}
