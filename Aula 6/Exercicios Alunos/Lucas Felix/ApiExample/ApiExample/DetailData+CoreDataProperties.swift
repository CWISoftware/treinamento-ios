//
//  DetailData+CoreDataProperties.swift
//  ApiExample
//
//  Created by retina on 11/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import Foundation
import CoreData


extension DetailData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DetailData> {
        return NSFetchRequest<DetailData>(entityName: "DetailData")
    }

    @NSManaged public var subtitleValue2: String?
    @NSManaged public var subtitleDescription1: String?
    @NSManaged public var subtitleValue1: String?
    @NSManaged public var title: String?
    @NSManaged public var subtitleDescription2: String?
    @NSManaged public var subtitleValue3: String?
    @NSManaged public var subtitleDescription3: String?

}
