//
//  Languages+CoreDataProperties.swift
//  TechmentAssignment
//
//  Created by NayomeDevapriyaAnga on 05/07/23.
//  Copyright © 2023 NayomeDevapriyaAnga. All rights reserved.
//
//

import Foundation
import CoreData


extension Languages {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Languages> {
        return NSFetchRequest<Languages>(entityName: "Languages")
    }

    @NSManaged public var itemId: Int32
    @NSManaged public var fullName: String?
    @NSManaged public var owner: String?
    @NSManaged public var langDescription: String?
    @NSManaged public var language: String?

}
