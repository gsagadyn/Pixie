//
//  UIWindow+RootViewController.swift.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

extension UIWindow {
    public func setRootViewController(
        _ viewController: UIViewController,
        withAnimationDuration duration: TimeInterval,
        delay: TimeInterval = 0.0,
        options: UIView.AnimationOptions = [.curveEaseInOut],
        completion: ((Bool) -> Void)? = nil) {
        
        guard duration.isNormal && UIApplication.shared.applicationState == .active else {
            rootViewController = viewController
            completion?(true)
            return
        }
        
        let snapshot = snapshotView(afterScreenUpdates: true) ?? UIView(frame: viewController.view.bounds)
        viewController.view.addSubview(snapshot)
        rootViewController = viewController
        
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            snapshot.alpha = 0.0
        }, completion:  { result in
            snapshot.removeFromSuperview()
            completion?(result)
        })
    }
}
