//
//  AppDelegate.swift
//  gg
//
//  Created by Josh Hunt on 30/08/2019.
//  Copyright © 2019 Josh Hunt. All rights reserved.
//

import UIKit
import OverlayContainer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mapsController = MainViewController()
        let searchController = SearchViewController()
        
        let containerController = OverlayContainerViewController()
        containerController.delegate = self
        containerController.viewControllers = [
            mapsController,
            searchController
        ]
        
        window?.rootViewController = containerController
        
        window?.makeKeyAndVisible()
        return true
    }
}


extension AppDelegate: OverlayContainerViewControllerDelegate {
    enum OverlayNotch: Int, CaseIterable {
        case minimum, medium, maximum
    }
    
    func numberOfNotches(in containerViewController: OverlayContainerViewController) -> Int {
        return OverlayNotch.allCases.count
    }
    
    func overlayContainerViewController(_ containerViewController: OverlayContainerViewController,
                                        heightForNotchAt index: Int,
                                        availableSpace: CGFloat) -> CGFloat {
        switch OverlayNotch.allCases[index] {
        case .maximum:
            return availableSpace * 3 / 4
        case .medium:
            return availableSpace / 2
        case .minimum:
            return availableSpace * 1 / 4
        }
    }
}
