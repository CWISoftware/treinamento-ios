//
//  SearchableService.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

protocol SearchableService {
    func getMostAccessed(completion: @escaping (_ result: [Searchable], _ status: NetworkStatus) -> Void)
    
    func get(name: String, page: Int, completion: @escaping (_ result: [Searchable], _ status: NetworkStatus) -> Void)
}
