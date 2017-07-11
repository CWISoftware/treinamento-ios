//
//  People.swift
//  starWarsApp
//
//  Created by retina on 10/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//


import Foundation

class People  {
    
    var name: String
    var hairColor:String
    var height:String
    var mass:String
    
    init(json: JSON) {
        self.name = json["name"] as! String
        self.hairColor = json["hair_color"] as! String
        self.height = json["height"] as! String
        self.mass = json["mass"] as! String
    }
    
    init(name:String, hairColor:String, mass:String, height: String) {
        self.name = name
        self.hairColor = hairColor
        self.height = height
        self.mass = mass
    }
    
    // TODO: Remover para uma classe especifica
    static func getPeople(id: Int, completion: @escaping (_ people : People?,_ error : Int)-> Void )  {
        Network.load(url: "people/\(id)", method: .get){(json, error) in
            if error == 0 {
                completion(People(json: json),error)
            }
            else{
                completion(nil, error)
            }
        }
    }
    
    static func searchPeople(name: String, completion: @escaping (_ peopleArray : [People]?,_ error : Int)-> Void )  {
        Network.load(url: "people/?search=\(name)", method: .get){(json, error) in
            let peopleStorage = PeopleStorage()
            var peopleArray = [People]()
            
            if error == 0 {
                
                if let listPeopleJson = json["results"] as? [JSON]{
                
                    for peopleJSON in listPeopleJson{
                        let people = People(json: peopleJSON)
                        self.storeIfDoesNotExists(people: people, peopleStorage: peopleStorage)
                        peopleArray.append(people)
                    }
                    
                    completion(peopleArray,error)
                }
                else{
                    completion(nil, 2)
                    
                }
            }
            else{
                if let peopleFromStorage = peopleStorage.get(withPredicate: NSPredicate(format: "name contains[c] %@", name)){
                    for peopleStored in peopleFromStorage{
                        let people = People(name: peopleStored.name!,hairColor: peopleStored.hairColor!,mass:String(peopleStored.mass), height: String(describing: peopleStored.height))
                        peopleArray.append(people)
                    }
                     completion(peopleArray, error)
                }
                else{
                    completion(nil, error)
                }
            }
        }
    }
    
    static func storeIfDoesNotExists(people: People, peopleStorage: PeopleStorage) {
        let formatter = NumberFormatter()
        formatter.generatesDecimalNumbers = true

       if peopleStorage.get(withPredicate: NSPredicate(format: "name = %@", people.name))?.count == 0 {
            peopleStorage.create(name: people.name, height: formatter.number(from:people.height) as! NSDecimalNumber, mass: formatter.number(from:people.mass) as! Int16, hairColor: people.hairColor)
        }
    }
}
