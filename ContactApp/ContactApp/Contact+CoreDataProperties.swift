//
//  Contact+CoreDataProperties.swift
//  ContactApp
//
//  Created by Megan Wilson on 7/12/19.
//  Copyright © 2019 Megan Wilson. All rights reserved.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var name: String?
    @NSManaged public var number: Double

}
