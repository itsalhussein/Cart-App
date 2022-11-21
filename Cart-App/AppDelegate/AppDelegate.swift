//
//  AppDelegate.swift
//  Cart-App
//
//  Created by Hussein Anwar on 20/11/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    var window : UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        setupWindow()
        return true
    }
    
    func setupWindow(){
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewController = Destinations.productsVC.viewcontroller
        _ = AppNavigator(window: window ?? UIWindow(), viewController: viewController)
    }

}

