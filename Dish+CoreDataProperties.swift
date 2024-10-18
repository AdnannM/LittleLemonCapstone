//
//  Dish+CoreDataProperties.swift
//  LittleLemonProjectCapstone
//
//  Created by Adnann Muratovic on 18.10.24.
//
//

import Foundation
import CoreData

import Foundation
import CoreData

@objc(Dish)
public class Dish: NSManagedObject {

}

extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var itemDescription: String?
    @NSManaged public var category: String?

}

extension Dish : Identifiable {
  
}
