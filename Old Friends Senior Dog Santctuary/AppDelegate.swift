//
//  AppDelegate.swift
//  Old Friends Senior Dog Santctuary
//
//  Created by Cal Stephens on 1/6/18.
//  Copyright © 2018 Cal Stephens. All rights reserved.
//

import UIKit
import AVKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var currentViewController: AVPlayerViewController? {
        return (window?.rootViewController as? UITabBarController)?.selectedViewController as? AVPlayerViewController
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        currentViewController?.viewWillDisappear(false)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        currentViewController?.viewWillAppear(true)
    }

}
