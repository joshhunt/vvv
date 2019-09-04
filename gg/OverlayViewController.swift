//
//  OverlayViewController.swift
//  gg
//
//  Created by Josh Hunt on 30/08/2019.
//  Copyright © 2019 Josh Hunt. All rights reserved.
//

import OverlayContainer
import UIKit

class OverlayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mapsController = MainViewController()
        let searchController = SearchViewController()
        
        let containerController = OverlayContainerViewController()
        containerController.delegate = self
        containerController.viewControllers = [
            mapsController,
            searchController
        ]
        
//        window?.rootViewController = containerController
    }
    

}


extension OverlayViewController: OverlayContainerViewControllerDelegate {
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
            return availableSpace * 0.9
        case .medium:
            return availableSpace / 2
        case .minimum:
            return availableSpace * 0.1
        }
    }
}
