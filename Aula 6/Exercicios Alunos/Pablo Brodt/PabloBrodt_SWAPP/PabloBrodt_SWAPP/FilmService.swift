//
//  PeopleService.swift
//  PabloBrodt_SWAPP
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class FilmService: SearchableService {
    private var network: NetworkService
    private var baseURL: String = "/films"
    
    init() {
        self.network = NetworkService()
    }
    
    func getMostAccessed(completion: @escaping (_ result: [Searchable], _ status: NetworkStatus) -> Void) {
        self.get(name: "", page: 1, completion: completion)
    }
    
    func get(name: String, page: Int, completion: @escaping (_ result: [Searchable], _ status: NetworkStatus) -> Void) {
        let url = baseURL + "?search=\(name)&page=\(page)"

        self.network.load(url: url) { (json, status) in
            if let results = json["results"] as? JSONList {
                let films = self.convertMultipleToModelList(jsonList: results)
                completion(films, status)
            }
        }
    }
    
    private func convertMultipleToModelList(jsonList: JSONList) -> [Film] {
        var modelList = [Film]()
        
        for json in jsonList {
            modelList.append(Film(json: json))
        }
        
        return modelList
    }
    
}
