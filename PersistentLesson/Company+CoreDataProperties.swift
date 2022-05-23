//
//  Company+CoreDataProperties.swift
//  PersistentLesson
//
//  Created by Ян Таше on 23.05.2022.
//
//

import Foundation
import CoreData


extension Company {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Company> {
        return NSFetchRequest<Company>(entityName: "Company")
    }

    @NSManaged public var name: String?
    @NSManaged public var employee: NSSet?

}

// MARK: Generated accessors for employee
extension Company {

    @objc(addEmployeeObject:)
    @NSManaged public func addToEmployee(_ value: User)

    @objc(removeEmployeeObject:)
    @NSManaged public func removeFromEmployee(_ value: User)

    @objc(addEmployee:)
    @NSManaged public func addToEmployee(_ values: NSSet)

    @objc(removeEmployee:)
    @NSManaged public func removeFromEmployee(_ values: NSSet)

}

extension Company : Identifiable {

}
