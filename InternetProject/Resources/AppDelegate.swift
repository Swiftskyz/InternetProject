//
//  AppDelegate.swift
//  InternetProject
//
//  Created by Himeno, Skylar on 12/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit

@UIApplicationMain
public class AppDelegte: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate
{
    
    var window: UIWindow?
    
    public func application(_ aaplication: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionKey: Any]?) -> Bool
    {
        // Override point for customization after application launch
        let splitViewController = window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        return true
    }
    
    public func applicationWillResignActive(_ application: UIApplication)
    {<#code#>}
    
    public func applicationDidEnterBackground(_ application: UIApplication)
    {<#code#>}
    
    public func applicationWillEnterForeground(_ application: UIApplication)
    {<#code#>}
    
    public func applicationDidBecomeActive(_ application: UIApplication)
    {<#code#>}
    
    public func applicationWillTerminate(_ application: UIApplication)
    {<#code#>}
    
    // MARK: - Split View
    public func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool
    {
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController
            else
        {return false}
        guard let topAsDetailController = secondaryAsNavController.topViewController as? InternetDetailViewController
            else
        {return false}
        
        return false
    }
}

