//
//  PeopleService.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class PlanetService: SearchableService {
    private var network: NetworkService
    private var baseURL: String = "/planets"
    
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
                let planets = self.convertMultipleToModelList(jsonList: results)
                completion(planets, status)
            }
        }
    }
    
    private func convertMultipleToModelList(jsonList: JSONList) -> [Planet] {
        var modelList = [Planet]()
        
        for json in jsonList {
            modelList.append(Planet(json: json))
        }
        
        return modelList
    }
    
}
