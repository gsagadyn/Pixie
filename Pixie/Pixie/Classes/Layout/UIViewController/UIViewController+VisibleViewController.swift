//
//  UIViewController+VisibleViewController.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

extension UIViewController {
    public var visibleViewController: UIViewController {
        return UIViewController.visibleViewController(relativeTo: self)
    }
    
    public static func visibleViewController(relativeTo viewController: UIViewController) -> UIViewController {
        if viewController.presentedViewController != nil,
            let child = viewController.presentedViewController {
            return visibleViewController(relativeTo: child)
        } else if
            let navigationController = viewController as? UINavigationController,
            let child = navigationController.visibleViewController {
            return visibleViewController(relativeTo: child)
        } else if
            let tabBarController = viewController as? UITabBarController,
            let child = tabBarController.selectedViewController {
            return visibleViewController(relativeTo: child)
        } else {
            return viewController
        }
    }
}
