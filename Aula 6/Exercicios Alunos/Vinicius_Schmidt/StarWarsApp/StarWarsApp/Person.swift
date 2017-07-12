//
//  Person.swift
//  ClientAPI
//
//  Created by retina on 08/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import CoreData
import UIKit

extension Person {
    @NSManaged var name: String
    @NSManaged var mass: String
    @NSManaged var birthYear: String
    @NSManaged var eyeColor: String
    @NSManaged var url: String
}

public class Person: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }
    
    static let entityName = "Person"
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    convenience init(json: JSON) {
        self.init(context: (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext)
        
        self.name = json["name"] as! String
        self.mass = json["mass"] as! String
        self.birthYear = json["birth_year"] as! String
        self.eyeColor = json["eye_color"] as! String
        self.url = json["url"] as! String
    }
    
    static func getPerson(_ id: Int, completion: @escaping (_ person: Person?, _ error: Int) -> Void) {
        Network.load(url: "people/\(id)") { (json, error) in
            if error == 0 {
                completion(Person(json: json), error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getPersonByName(_ name: String, completion: @escaping (_ person: Person?, _ error: Int) -> Void) {
        Network.load(url: "people/?search=\(name)") { (json, error) in
            if error == 0 {
                
                if let results = json["results"] as? [JSON] {
                    if results.count > 0 {
                        completion(Person(json: results[0]), error)
                    }
                } else {
                    completion(nil, 74)
                }
            } else {
                completion(nil, error)
            }
            
        }
    }
    
    static func getPeopleByName(_ name: String, completion: @escaping (_ people: [Person]?, _ error: Int) -> Void) {
        Network.load(url: "people?search=\(name)") { (json, error) in
            if error == 0 {
                var people = [Person]()
                
                if let results = json["results"] as? [JSON] {
                    for person in results {
                        people.append(Person(json: person))
                    }
                } else {
                    completion(nil, 74)
                }
                
                completion(people, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    static func getPeople(completion: @escaping (_ people: [Person]?, _ error: Int) -> Void) {
        Network.load(url: "people") { (json, error) in
            if error == 0 {
                var people = [Person]()
                
                if let results = json["results"] as? [JSON] {
                    for person in results {
                        people.append(Person(json: person))
                    }
                } else {
                    completion(nil, 74)
                }
                
                completion(people, error)
            } else {
                completion(nil, error)
            }
        }
    }
    
    // MARK: DB
    /*
    static func createOrUpdate(_ person: Person) -> Person {
        var option = 0
        option = update(person)
        
        if option == 0 {
            create(person)
            option = 2
        }
        print("executou opção \(option) para pessoa \(person.name)")
        return person
    }
    
    static func create(_ person: Person) -> Person {
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: Person.entityName, into: context) as! Person
        
        newItem.name = person.name
        newItem.mass = person.mass
        newItem.birthYear = person.birthYear
        newItem.eyeColor = person.eyeColor
        newItem.url = person.url
        self.saveContext()
        
        return newItem
    }
    */
    static func getById(id: NSManagedObjectID) -> Person? {
        return context.object(with: id) as? Person
    }
    
    static func getByURL(_ url: String) -> Person? {
        let predicate = NSPredicate(format: "url == %@", url)
        let people = get(withPredicate: predicate)
        if people.count > 0 {
            return people[0]
        }
        return nil
    }
    
    static func getByName(_ name: String) -> [Person] {
        if name != "" {
            let predicate = NSPredicate(format: "name contains %@", name)
            return get(withPredicate: predicate)
        } else {
            return getAll()
        }
    }
    
    static func get(withPredicate queryPredicate: NSPredicate) -> [Person] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Person.entityName)
        
        fetchRequest.predicate = queryPredicate
        
        do {
            let response = try context.fetch(fetchRequest)
            return response as! [Person]
        } catch let error as NSError {
            // failure
            print(error)
            return [Person]()
        }
    }
    
    static func getAll() -> [Person] {
        return get(withPredicate: NSPredicate(value:true))
    }
    /*
    static func update(_ updatedPerson: Person) -> Int {
        //não funciona
        //if let person = getById(id: updatedPerson.objectID) {
        let person = getByURL(updatedPerson.url)
        var returnStatus = 0
        
        if person != nil {
//            person?.name = updatedPerson.name
//            person?.mass = updatedPerson.mass
//            person?.birthYear = updatedPerson.birthYear
//            person?.eyeColor = updatedPerson.eyeColor
//            person?.url = updatedPerson.url
//            returnStatus = 1
            delete(id: (person?.objectID)!)
        }
        self.saveContext()
        return returnStatus
        
    }
    */
    static func delete(id: NSManagedObjectID) {
        if let personToDelete = getById(id: id) {
            context.delete(personToDelete)
        }
        self.saveContext()
    }
    
    static func clearDB() {
        let people = getAll()
        for person in people {
            Person.delete(id: person.objectID)
        }
        self.saveContext()
    }
    
    static func saveContext() {
        do {
            try context.save()
        } catch {
            fatalError("Error while saving context!")
        }
    }
    
    
}
