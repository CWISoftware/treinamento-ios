//
//  Film.swift
//  ApiExample
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Film {
    
    var title: String
    var episode: String
    var releaseYear: String
    var director: String
    
    init?(json: JSON) {
        self.title = json["title"] as! String
        self.episode = String(json["episode_id"] as! Int)
        self.releaseYear = json["release_date"] as! String
        self.director = json["director"] as! String
    }
    
    
    static func getAll(completion: @escaping (_ film: [Film]?, _ error: Int) -> Void) {
        Network.load(url: "films/") { (json, error) in
            if error == 0 {
                var films: [Film] = []
                for case let result in json["results"] as! [JSON] {
                    if let film = Film(json: result) {
                        films.append(film)
                    }
                }
                completion(films, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getFilm(_ id: Int, completion: @escaping (_ person: Film?, _ error: Int) -> Void) {
        Network.load(url: "films/\(id)") { (json, error) in
            if error == 0 {
                completion(Film(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
}
