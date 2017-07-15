//
//  ListItem.swift
//  starwars
//
//  Created by InfraCWI on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

struct ListItem {
    
    var name: String
    
    var detailUrl: String
    
    init(json: JSON) {
        self.name = json["name"] as! String
        self.detailUrl = json["url"] as! String
    }
    
    static func populateList(_ url: String, completion: @escaping (_ people: Array<ListItem>) -> Void) {
        Network.load(url: url) { json in
            
            if json["count"] as! Int == 0 {
                return
            }
            
            let itemsRawList = json["results"] as! Array<JSON>
            var itemResult = Array<ListItem>()
            
            for item in itemsRawList {
                let listItem = ListItem(json: item)
                itemResult.append(listItem)
            }
            
            completion(itemResult)
        }
    }
    
}
