//
//  PersonLocal+CoreDataClass.swift
//  StarWars
//
//  Created by InfraCWI on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import CoreData
import UIKit


public class PersonLocal: NSManagedObject {
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static let entityName = "PersonLocal"
    
    class func create(person: Person) -> PersonLocal {
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: PersonLocal.entityName, into: context) as! PersonLocal
        
        newItem.image = NSData()
        newItem.name = person.name
        newItem.height = person.height
        newItem.mass = person.mass
        newItem.hairColor = person.hairColor
        
        self.save()
        
        return newItem
    }
    
    class func getById(id: NSManagedObjectID) -> PersonLocal? {
        return context.object(with: id) as? PersonLocal
    }
    
    class func getByName(name: String) -> [PersonLocal]? {
        return self.get(withPredicate: NSPredicate(format: "name == %@", name))
    }
    
    class func get(withPredicate queryPredicate: NSPredicate) -> [PersonLocal]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: PersonLocal.entityName)
        
        fetchRequest.predicate = queryPredicate
        
        do {
            let response = try context.fetch(fetchRequest)
            return response as! [PersonLocal]
        } catch let error as NSError {
            // failure
            print(error)
            return [PersonLocal]()
        }
    }
    
    class func getAll() -> [PersonLocal]{
        return get(withPredicate: NSPredicate(value:true))
    }
    
    class func update(updatedPersonLocal: PersonLocal){
        if let PersonLocal = getById(id: updatedPersonLocal.objectID){
            PersonLocal.image = updatedPersonLocal.image
            PersonLocal.name = updatedPersonLocal.name
            PersonLocal.height = updatedPersonLocal.height
            PersonLocal.mass = updatedPersonLocal.mass
            PersonLocal.hairColor = updatedPersonLocal.hairColor
        }
    }
    
    class func delete(id: NSManagedObjectID){
        if let PersonLocalToDelete = getById(id: id){
            context.delete(PersonLocalToDelete)
        }
        self.save()
    }
    
    class func save() {
        do {
            try context.save()
        } catch {
            fatalError("Context save failed!")
        }
    }

}
