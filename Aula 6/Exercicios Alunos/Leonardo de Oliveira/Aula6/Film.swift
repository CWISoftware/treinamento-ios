//
//  Film.swift
//  Aula6
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct Film {
    var title: String
    var director: String
    var releaseYear: Int
    var episode: Int
    
    init(json: JSON) {
        self.title = json["title"] as! String
        self.director = json["director"] as! String
        
        let dataString = json["release_date"] as! String
        if let jsonYear = Int(dataString.components(separatedBy: "-")[0]) {
            self.releaseYear =  jsonYear
        }
        else
        {
            self.releaseYear = 0
        }
        
        if let jsonEpisode = json["episode_id"] as? Int {
            self.episode =  jsonEpisode
        }
        else
        {
            self.episode = 0
        }
    }
    
    static func getFilm(_ id: Int, completion: @escaping (_ film: Film?, _ status : HTTPStatusCodes) -> Void) {
        Network.load(url: "starships/\(id)") { (json, status) in
            if (status == HTTPStatusCodes.OK) {
                completion(Film(json: json!), status)
            }
            else {
                completion(nil, status)
            }
        }
    }
}
