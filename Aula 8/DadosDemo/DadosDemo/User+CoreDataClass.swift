//
//  User+CoreDataClass.swift
//  DadosDemo
//
//  Created by Juliano Krieger Nardon on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class User: NSManagedObject {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static let entityName = "User"
    
    func create(name: String, age: NSNumber) -> User {
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: User.entityName, into: context) as! User
        
        newItem.name = name
        newItem.age = age
        
        return newItem
    }
    
    func getById(id: NSManagedObjectID) -> User? {
        return context.object(with: id) as? User
    }
    
    func get(withPredicate queryPredicate: NSPredicate) -> [User]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: User.entityName)
        
        fetchRequest.predicate = queryPredicate
        
        do {
            let response = try context.fetch(fetchRequest)
            return response as! [User]
        } catch let error as NSError {
            // failure
            print(error)
            return [User]()
        }
    }
    
    func getAll() -> [User]{
        return get(withPredicate: NSPredicate(value:true))
    }
    
    func update(updatedPerson: User){
        if let person = getById(id: updatedPerson.objectID){
            person.name = updatedPerson.name
            person.age = updatedPerson.age
        }
    }
    
    func delete(id: NSManagedObjectID){
        if let personToDelete = getById(id: id){
            context.delete(personToDelete)
        }
    }
    
    
    
}
