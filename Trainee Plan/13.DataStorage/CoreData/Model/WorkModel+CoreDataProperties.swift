//
//  WorkModel+CoreDataProperties.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 22.11.2021.
//
//

import Foundation
import CoreData


extension WorkModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WorkModel> {
        return NSFetchRequest<WorkModel>(entityName: "Work")
    }

    @NSManaged public var name: String?
    @NSManaged public var wage: Float
    @NSManaged public var user: NSSet?

}

// MARK: Generated accessors for user
extension WorkModel {

    @objc(addUserObject:)
    @NSManaged public func addToUser(_ value: UserModel)

    @objc(removeUserObject:)
    @NSManaged public func removeFromUser(_ value: UserModel)

    @objc(addUser:)
    @NSManaged public func addToUser(_ values: NSSet)

    @objc(removeUser:)
    @NSManaged public func removeFromUser(_ values: NSSet)

}

extension WorkModel : Identifiable {

}
