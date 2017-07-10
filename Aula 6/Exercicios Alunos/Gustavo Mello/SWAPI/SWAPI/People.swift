//
//  People.swift
//  SWAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct People {
    var name: String
    var id: Int
    
    init (json: JSON) {
        self.name = json["name"] as! String
        
        // API nao retorna ID, entao extraimos o mesmo da url (Ex: "http://swapi.co/api/people/5/")
        var itens = (json["url"] as! String).components(separatedBy: "/")
        self.id = Int(itens[itens.count - 2])!
    }
}
