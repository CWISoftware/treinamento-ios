//
//  PersonLocal+CoreDataProperties.swift
//  StarWars
//
//  Created by InfraCWI on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import CoreData


extension PersonLocal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonLocal> {
        return NSFetchRequest<PersonLocal>(entityName: "PersonLocal")
    }

    @NSManaged public var hairColor: String?
    @NSManaged public var height: String?
    @NSManaged public var image: NSData?
    @NSManaged public var mass: String?
    @NSManaged public var name: String?

}
