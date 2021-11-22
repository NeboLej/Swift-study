//
//  CoreDataManager.swift
//  Trainee Plan
//
//  Created by Anton Pakhomov on 22.11.2021.
//

import Foundation
import CoreData

class CoreDataManager {
    
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "UserData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var viewContext: NSManagedObjectContext = persistentContainer.viewContext

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    

    
    func createMainUser() -> UserModel {
        let user = UserModel(context: viewContext)
        user.name = "Oleg"
        user.age = 30
        let work = WorkModel(context: viewContext)
        work.name = "WD"
        user.work = work
        
        
        do {
            try viewContext.save()
        } catch let error {
            print(error)
        }
        return user
    }

    func addUser(user: UserModel) {
        do {
            try viewContext.save()
        } catch let error {
            print(error)
        }
    }
    
    func getAllUsers() -> [UserModel] {
        let fetchReqest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchReqest.predicate = NSPredicate(format: "isDelited = false")
        
        if let users = try? viewContext.fetch(fetchReqest) as? [UserModel], !users.isEmpty {
            return users
        }
        
        return []
    }
}
