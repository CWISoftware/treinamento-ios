//
//  PeopleService.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class StarshipService: SearchableService {
    private var network: NetworkService
    private var baseURL: String = "/starships"
    
    init() {
        self.network = NetworkService()
    }
    
    func getMostAccessed(completion: @escaping (_ : [Searchable], _ status: NetworkStatus) -> Void) {
        self.get(name: "", page: 1, completion: completion)
    }
    
    func get(name: String, page: Int, completion: @escaping (_ : [Searchable], _ status: NetworkStatus) -> Void) {
        let url = baseURL + "?search=\(name)&page=\(page)"
        
        self.network.load(url: url) { (json, status) in
            if let results = json["results"] as? JSONList {
                let starships = self.convertMultipleToModelList(jsonList: results)
                completion(starships, status)
            }
        }
    }
    
    private func convertMultipleToModelList(jsonList: JSONList) -> [Starship] {
        var modelList = [Starship]()
        
        for json in jsonList {
            modelList.append(Starship(json: json))
        }
        
        return modelList
    }
    
}
