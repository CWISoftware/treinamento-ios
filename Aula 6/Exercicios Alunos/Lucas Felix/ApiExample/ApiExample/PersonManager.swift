//
//  PersonManager.swift
//  ApiExample
//
//  Created by retina on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation

class PersonManager {
    
    static func getAll() -> [Person] {
        var list = [Person]()
//        let detailData = DetailData()
        
        Person.getAll() { (person, error) in
            if let response = person {
                if error == 0 {
                    list = response as [Person]
                    
//                    for item in list {
//                        detailData.save(title: item.name, subtitleValue1: item.height, subtitleDescription1: "HEIGHT", subtitleValue2: item.mass, subtitleDescription2: "MASS", subtitleValue3: item.hairColor, subtitleDescription3: "HAIR COLOR")
//                    }
                }
            }
            else {
//                var storedData = [Person]()
//                
//                for data in detailData.getAll(){
//                    storedData.append(Person(name: data.title!, height: data.subtitleValue1!, mass: data.subtitleValue2!, hairColor: data.subtitleValue3!))
//                }
//                
//                list = storedData
            }
        }
        
        return list
    }
}
