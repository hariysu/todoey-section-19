//
//  AppDelegate.swift
//  Todoey-Section-19
//
//  Created by Abdurahman on 29.01.2024.
//

import UIKit
import CoreData
 
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
 
    var window: UIWindow?
 
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }
 
 
    func applicationWillTerminate(_ application: UIApplication) {
        
        self.saveContext()
 
    }
 
    
    // MARK: - Core Data stack
    // We create a new NSPersistentContainer using our CoreData DataModel. And this persistentContainer is the database that we're going to be saving to and as a SQLITE database.

    lazy var persistentContainer: NSPersistentContainer = {
 
        let container = NSPersistentContainer(name: "DataModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
 
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
 
    // MARK: - Core Data Saving support
    // We have this thing called a context which is what's called a scratch pad or a temporary area where you can update, change, delete your data until you're happy with the format. And then we basically commit it to permanent storage.
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
 
}

