//
//  AppDelegate.swift
//  FitnessApp
//
//  Created by 123 on 8.08.23.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let mainTabBarController = MainTabBarController()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "StaticModel")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            
            let isFirstLaunch = !UserDefaults.standard.bool(forKey: "isFirstLaunch")
            print("isFirstLaunch: \(isFirstLaunch)")
            let rootViewController = isFirstLaunch ? RegistrationConttroler() : ViewController()
            
            let navigationController = UINavigationController(rootViewController: rootViewController)
            window?.rootViewController = MainTabBarController()
            mainTabBarController.tabBar.barTintColor = UIColor.red
            window?.makeKeyAndVisible()
            
            return true
        }
    
    func applicationWillTerminate(_ application: UIApplication) {
        saveContext()
    }
    
    
    func saveContext() {
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



