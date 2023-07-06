//
//  AppDelegate.swift
//  BMS_Swift
//
//  Created by MAC on 7.6.23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.makeKeyAndVisible()
        
        VHLNavigation.hook()
        VHLNavigation.def.navBarShadowImageHidden = true
        
        window?.rootViewController = BaseTabBarController()
        
        return true
    }


}

