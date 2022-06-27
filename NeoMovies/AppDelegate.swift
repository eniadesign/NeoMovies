//
//  AppDelegate.swift
//  examUpax
//
//  Created by Alfonso Mariano Hernandez Espinosa on 16/06/22.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.navigationController     =   UINavigationController()
        navigationController?.isNavigationBarHidden = true
    
        
        self.navigationController     =   UINavigationController()
        navigationController?.isNavigationBarHidden = true
        let loginScreen = LoginMain.createModule(navigation: navigationController!)
        navigationController?.initRootViewController(loginScreen)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = navigationController
        self.window?.backgroundColor = .black
        self.window?.makeKeyAndVisible()
        return true
    }


}

