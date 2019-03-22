//
//  AppDelegate.swift
//  Qaid Baloot
//
//  Created by Abdulaziz Alsaloum on 15/03/2019.
//  Copyright © 2019 Abdulaziz Alsaloum. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let dataController = DataController(modelName: "Qaid_Baloot")

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        dataController.load()
        
        let mainView = MainViewController()
        let navigationController = UINavigationController(rootViewController: mainView)
        navigationController.navigationBar.isTranslucent = false
        window?.rootViewController = mainView
        window?.makeKeyAndVisible()
        
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) { self.saveContext() }

    func applicationWillTerminate(_ application: UIApplication) { self.saveContext() }
    
    // MARK: - Core Data Saving support
    func saveContext() {
        if dataController.viewContext.hasChanges {
            try? dataController.viewContext.save()
        }
    }
}
