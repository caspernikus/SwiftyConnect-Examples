//
//  AppDelegate.swift
//  SwiftyConnect-Example
//
//  Created by Benedikt Veith on 17.04.18.
//  Copyright © 2018 benedikt-veith. All rights reserved.
//

import UIKit
import SwiftyConnect

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let steem = Steem.sharedInstance
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        steem.initialize(config: ["api": "https://api.steemit.com"])
        steem.auth.setConfig(conf: [
            "client_id": "swiftyconnect",
            "client_secret": "46fbf7236bc84a9a2c251bee152fcb1f3325fae613e71af2",
            "authorize_uri": "https://v2.steemconnect.com/oauth2/authorize",
            "token_uri": "https://v2.steemconnect.com/api/oauth2/token",
            "redirect_uris": ["testauthapp://oauth/callback"],
            "scope": "login,offline,vote,comment,custom_json",
            "should_Debug": true,
            ])
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        if "testauthapp" == url.scheme {
            steem.auth.handleRedirectURL(url: url)
            return true
        }
        return false
    }
}
