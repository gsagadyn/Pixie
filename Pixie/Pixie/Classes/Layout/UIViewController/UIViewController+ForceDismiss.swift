//
//  UIViewController+ForceDismiss.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 07/03/2022.
//

import UIKit

extension UIViewController {
    public func dismiss(force: Bool) {
        force ? UIViewController.forceDismiss(self) : dismiss(animated: false)
    }

    private static func forceDismiss(_ viewController: UIViewController) {
        viewController.dismiss(animated: false, completion: nil)
        viewController.presentedViewController.map(forceDismiss)
        viewController.children.forEach(forceDismiss)

        switch viewController {
        case let vc as UINavigationController:
            vc.viewControllers.forEach(forceDismiss)
        case let vc as UITabBarController:
            vc.viewControllers?.forEach(forceDismiss)
        default:
            break
        }
    }
}
