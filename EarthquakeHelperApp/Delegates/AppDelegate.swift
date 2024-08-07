//
//  AppDelegate.swift
//  EarthquakeHelperApp
//
//  Created by Berkay Sarıkaya on 13.01.2024.
//

import UIKit
import FirebaseCore
import GoogleMaps

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        // In your AppDelegate or wherever you initialize view controllers
        
        GMSServices.provideAPIKey("AIzaSyBjyDP0BF-QXT4Dm2oa0oNMrn25Zwgnzqk")
        let openingScreenVC = OpeningScreenViewController()
        let navigationController = UINavigationController(rootViewController: openingScreenVC)

        // Set navigationController as the root view controller
        window.rootViewController = navigationController
        window.makeKeyAndVisible()


            return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

