//
//  DataResponseExtension.swift
//  ClientAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import Alamofire

extension DataResponse {
    var isSuccessfull: Bool! {
        if let r = self.response {
            let statusCode = r.statusCode
            
            return statusCode >= 200 && statusCode < 300
        }
        
        return false
    }
    
    var isUnauthorized: Bool! {
        if let r = self.response {
            let statusCode = r.statusCode
            
            return statusCode == 401
        }
        
        return false
        
    }
}
