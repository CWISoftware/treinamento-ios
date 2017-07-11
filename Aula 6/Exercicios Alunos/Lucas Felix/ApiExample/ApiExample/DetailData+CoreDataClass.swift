//
//  DetailData+CoreDataClass.swift
//  ApiExample
//
//  Created by retina on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class DetailData: NSManagedObject {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    static let entityName = "DetailData"
    
    func create(title: String, subtitleValue1: String, subtitleDescription1: String, subtitleValue2: String, subtitleDescription2: String, subtitleValue3: String, subtitleDescription3: String) -> DetailData {
        
        let newItem = NSEntityDescription.insertNewObject(forEntityName: DetailData.entityName, into: context) as! DetailData
        
        newItem.title = title
        newItem.subtitleValue1 = subtitleValue1
        newItem.subtitleValue2 = subtitleValue2
        newItem.subtitleValue3 = subtitleValue3
        newItem.subtitleDescription1 = subtitleDescription1
        newItem.subtitleDescription2 = subtitleDescription2
        newItem.subtitleDescription3 = subtitleDescription3
        
        return newItem
    }
    
    func getById(id: NSManagedObjectID) -> DetailData? {
        return context.object(with: id) as? DetailData
    }
    
    func get(withPredicate queryPredicate: NSPredicate) -> [DetailData]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: DetailData.entityName)
        
        fetchRequest.predicate = queryPredicate
        
        do {
            let response = try context.fetch(fetchRequest)
            return response as! [DetailData]
        } catch let error as NSError {
            // failure
            print(error)
            return [DetailData]()
        }
    }
    
    func getFirst(withPredicate: NSPredicate) -> DetailData? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: DetailData.entityName)
        
        fetchRequest.predicate = withPredicate
        
        do {
            let response = try context.fetch(fetchRequest)
            let persons = response as! [DetailData]
            
            return persons[0]
        } catch let error as NSError {
            // failure
            print(error)
            return nil
        }
    }
    
    func getAll() -> [DetailData]{
        return get(withPredicate: NSPredicate(value:true))
    }
    
    func update(updatedPerson: DetailData) -> DetailData? {
        if let person = getById(id: updatedPerson.objectID){
            person.title = updatedPerson.title
            person.subtitleValue1 = updatedPerson.subtitleValue1
            person.subtitleValue2 = updatedPerson.subtitleValue2
            person.subtitleValue3 = updatedPerson.subtitleValue3
            person.subtitleDescription1 = updatedPerson.subtitleDescription1
            person.subtitleDescription2 = updatedPerson.subtitleDescription2
            person.subtitleDescription3 = updatedPerson.subtitleDescription3
            
            return person
        }
        else{
            return nil
        }
    }
    
    func delete(id: NSManagedObjectID){
        if let personToDelete = getById(id: id){
            context.delete(personToDelete)
        }
    }
    
    func save(title: String, subtitleValue1: String, subtitleDescription1: String, subtitleValue2: String, subtitleDescription2: String, subtitleValue3: String, subtitleDescription3: String) -> DetailData {
        
        if let personReturned = getFirst(withPredicate: NSPredicate(format: "title = %s", argumentArray: [title])){
            
            personReturned.title = title
            personReturned.subtitleValue1 = subtitleValue1
            personReturned.subtitleValue2 = subtitleValue2
            personReturned.subtitleValue3 = subtitleValue3
            personReturned.subtitleDescription1 = subtitleDescription1
            personReturned.subtitleDescription2 = subtitleDescription2
            personReturned.subtitleDescription3 = subtitleDescription3
            
            return update(updatedPerson: personReturned)!
        } else {
            return create(title: title, subtitleValue1: subtitleValue1, subtitleDescription1: subtitleDescription1, subtitleValue2: subtitleValue2, subtitleDescription2: subtitleDescription2, subtitleValue3: subtitleValue3, subtitleDescription3: subtitleDescription3)
        }
    }


}
