//
//  AppDelegate.swift
//  WhatsAppClone
//
//  Created by Marilise Morona on 15/10/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        let vcStatus = StatusViewController()
        let vcCalls = CallsViewController()
        let vcCamera = CameraViewController()
        let vcChats = ChatsViewController()
        let vcSettings = SettingsViewController()
        
//        vcStatus.tabBarItem = UITabBarItem(title: "Status", image: UIImage(named: "status"), tag: 0)
        vcStatus.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 0)
        vcCalls.tabBarItem = UITabBarItem(tabBarSystemItem: .recents, tag: 1)
        vcCamera.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
        vcChats.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 4)
        vcSettings.tabBarItem = UITabBarItem(tabBarSystemItem: .mostViewed, tag: 5)
        
        let ncStatus = UINavigationController(rootViewController: vcStatus)
        let ncCalls = UINavigationController(rootViewController: vcCalls)
        let ncCamera = UINavigationController(rootViewController: vcCamera)
        let ncChats = UINavigationController(rootViewController: vcChats)
        let ncSettings = UINavigationController(rootViewController: vcSettings)
        
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [ncStatus, ncCalls, ncCamera, ncChats, ncSettings]
        
        window?.rootViewController = tabBarController
        
        return true
    }
}
