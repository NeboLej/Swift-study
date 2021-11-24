//
//  UserModel+CoreDataProperties.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 22.11.2021.
//
//

import Foundation
import CoreData


extension UserModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserModel> {
        return NSFetchRequest<UserModel>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var id: UUID?
    @NSManaged public var isDelited: Bool
    @NSManaged public var work: WorkModel?

}

extension UserModel : Identifiable {

}
