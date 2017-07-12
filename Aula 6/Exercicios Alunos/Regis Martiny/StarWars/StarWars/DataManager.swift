//
//  DataManager.swift
//  StarWars
//
//  Created by InfraCWI on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataManager {
    
    class func saveOrUpdateAll(people: [Person], completion: @escaping (_ error: Int) -> Void) {
                
        var i = 0
        for person in people {
            let personLocal = PersonLocal.getByName(name: person.name)
            if personLocal != nil && personLocal!.count > 0 {
                PersonLocal.update(updatedPersonLocal: personLocal![0])
            } else {
                PersonLocal.create(person: person)
                i = i + 1
            }
        }
        print("People created: \(i)")
        completion(0)
        
    }

    
    class func getAll(completion: @escaping (_ people: [Person], _ error: Int) -> Void) {
        
        var people = [Person]()

        let  peopleLocal = PersonLocal.getAll()
            
        print("Total people in base: \(peopleLocal.count)")
            
        for personLocal in peopleLocal {
            var uiimage = UIImage()
            if (personLocal.image != nil) {
                uiimage = UIImage(data:personLocal.image! as Data,scale:1.0)!
            }
            let person = Person(image: uiimage, name: personLocal.name!, height: personLocal.height!, mass: personLocal.mass!, hairColor: personLocal.hairColor!)
            people.append(person)
            print("Person fetched: ")
            print(personLocal)
        }
        
        completion(people, 0)
    }
    
    
    class func deleteAll() {
        
        for person in PersonLocal.getAll() {
            PersonLocal.delete(id: person.objectID)
        }
    }
}
