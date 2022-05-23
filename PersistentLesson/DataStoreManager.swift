//
//  DataStoreManager.swift
//  PersistentLesson
//
//  Created by Ян Таше on 23.05.2022.
//

import Foundation
import CoreData

// MARK: - Core Data stack

class DataStoreManager {
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "PersistentLesson")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    lazy var viewContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()

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
    
    func obtainMainUser() -> User {
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchRequest.predicate = NSPredicate(format: "isMain = true")
        
        if let users = try? viewContext.fetch(fetchRequest) as? [User], !users.isEmpty {
            return users.first!
        } else {
         
        let company = Company(context: viewContext)
        let user = User(context: viewContext)
        user.name = "Mark"
        user.age = 23
        company.name = "Apple"
        user.company = company
        user.isMain = true
        
        do {
            try viewContext.save()
        } catch let error {
            print(error)
        }
        
        return user
        }}
        
    
    func updateMainUser(with name: String) {
        
    }
}
