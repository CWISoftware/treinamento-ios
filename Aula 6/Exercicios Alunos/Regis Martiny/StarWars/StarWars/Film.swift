//
//  Film.swift
//  StarWars
//
//  Created by InfraCWI on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import UIKit

class Film : Item {
    var title: String
    var episode: Int
    var releaseDate: String
    var director: String
    
    init(json: JSON) {
        let image = UIImage()
        self.title = json["title"] as! String
        self.episode = json["episode_id"] as! Int
        self.releaseDate = json["release_date"] as! String
        self.director = json["director"] as! String
        
        let index = self.releaseDate.index(self.releaseDate.startIndex, offsetBy: 4)
        let releaseYear = self.releaseDate.substring(to: index)
        
        super.init(image: image, name: self.title, leftPropertyName: "EPISODE", leftPropertyValue: String(self.episode), centerPropertyName: "RELEASE YEAR", centerPropertyValue: releaseYear, rightPropertyName: "DIRECTOR", rightPropertyValue: self.director)
    }
    
    init(image: UIImage, title: String, episode: Int, releaseDate: String, director: String) {
        self.title = title
        self.episode = episode
        self.releaseDate = releaseDate
        self.director = director
        
        super.init(image: image, name: self.title, leftPropertyName: "PASSENGERS", leftPropertyValue: String(self.episode), centerPropertyName: "CREW", centerPropertyValue: self.releaseDate, rightPropertyName: "HD RATING", rightPropertyValue: self.director)
        
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
    
    static func getFilm(_ name: String, completion: @escaping (_ film: Film?, _ error: Int) -> Void) {
        Network.load(url: "films/?search=\(name)") { (json, error) in
            if error == 0 {
                completion(Film(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getFilms(_ name: String, completion: @escaping (_ film: [Film]?, _ error: Int) -> Void) {
        Network.load(url: "films/?search=\(name)") { (json, error) in
            
            var films = [Film]()
            
            if let results = json["results"] as? [JSON] {
                for film in results {
                    films.append(Film(json: film))
                }
            }
            
            if error == 0 {
                completion(films, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getAll(completion: @escaping (_ film: [Film]?, _ error: Int) -> Void) {
        Network.load(url: "films") { (json, error) in
            
            var films = [Film]()
            
            if let results = json["results"] as? [JSON] {
                for film in results {
                    films.append(Film(json: film))
                }
            }
            
            if error == 0 {
                completion(films, error)
            } else {
                completion(nil, error)
            }
        }
    }
}
