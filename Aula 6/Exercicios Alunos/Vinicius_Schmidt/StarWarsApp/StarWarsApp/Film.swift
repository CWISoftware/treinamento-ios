//
//  Person.swift
//  ClientAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Film {
    var title: String
    var episode: Int
    var year: String
    var director: String
    
    init(json: JSON) {
        self.title = json["title"] as! String
        self.episode = json["episode_id"] as! Int
        self.year = json["release_date"] as! String
        self.director = json["director"] as! String
    }
    
    static func getFilm(_ id: Int, completion: @escaping (_ film: Film?, _ error: Int) -> Void) {
        Network.load(url: "films/\(id)") { (json, error) in
            if error == 0 {
                completion(Film(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getFilmByName(_ name: String, completion: @escaping (_ film: Film?, _ error: Int) -> Void) {
        Network.load(url: "films/?search=\(name)") { (json, error) in
            if error == 0 {
                
                if let results = json["results"] as? [JSON] {
                    if results.count > 0 {
                        completion(Film(json: results[0]), error)
                    }
                } else {
                    completion(nil, 74)
                }
            } else {
                completion(nil, error)
            }
            
        }
    }
    
    static func getFilmsByName(_ name: String, completion: @escaping (_ films: [Film]?, _ error: Int) -> Void) {
        Network.load(url: "films?search=\(name)") { (json, error) in
            if error == 0 {
                var films = [Film]()
                
                if let results = json["results"] as? [JSON] {
                    for film in results {
                        films.append(Film(json: film))
                    }
                } else {
                    completion(nil, 74)
                }
                
                completion(films, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getFilms(completion: @escaping (_ films: [Film]?, _ error: Int) -> Void) {
        Network.load(url: "films") { (json, error) in
            if error == 0 {
                var films = [Film]()
                
                if let results = json["results"] as? [JSON] {
                    for film in results {
                        films.append(Film(json: film))
                    }
                } else {
                    completion(nil, 74)
                }
                
                completion(films, error)
            } else {
                completion(nil, error)
            }
        }
    }
}
