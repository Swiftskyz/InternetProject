//
//  InternetDetailViewController.swift
//  InternetProject
//
//  Created by Himeno, Skylar on 12/14/18.
//  Copyright © 2018 CTEC. All rights reserved.
//

import UIKit
import WebKit

@UIApplicationMain
public class AppDelegte: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate
{
    
    var window: UIWindow?
    
    public func application(_ aaplication: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionKey: Any]?) -> Bool
    {
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

public class InternetDetailViewController: UIViewController
{
    
    @IBOutlet weak var webViewer: WKWebView!
    @IBOutlet weak var screenTitle: UILabel!
    
    var detailTitle : String?
    {
        didSet
        {
            updateView( )
        }
    }
    
    var detailAddress : String?
    {
        didSet
        {
            updateView( )
        }
    }
    
    private func updateView( ) -> Void
    {
        if (detailTitle != nil && screenTitle != nil && webViewer != nil)
        {
            if (detailTitle?.range(of: "Definitions", options: .caseInsensitive) != nil)
            {
                loadPDF( )
            }
            else
            {
                if (detailAddress != nil)
                {
                    loadURL(webAddress: detailAddress!)
                }
            }
            screenTitle?.text = detailTitle
        }
    }
    
    public override func viewDidLoad( ) -> Void
    {
        super.viewDidLoad( )
        
        updateView( )
    }
    
    public func loadURL(webAddress: String) -> Void
    {
        let currentURL = URL(string: webAddress)
        let currentWebRequest = URLRequest(url: currentURL!)
        webViewer.load(currentWebRequest)
    }
    
    private func loadPDF( ) -> Void
    {
        if let contentPDF = Bundle.main.url(forResource: "PDF Name", withExtension: "pdf", subdirectory: nil, localization: nil)
        {
            let requestPDF = NSURLRequest(url: contentPDF)
            webViewer.load(requestPDF as URLRequest)
        }
    }
}
