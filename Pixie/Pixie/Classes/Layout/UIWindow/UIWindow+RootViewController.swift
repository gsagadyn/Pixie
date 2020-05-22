//
//  UIWindow+RootViewController.swift
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
        type: CATransitionType = .fade,
        subtype: CATransitionSubtype? = nil,
        timingFunction: CAMediaTimingFunctionName = .easeInEaseOut,
        completion: ((Bool) -> Void)? = nil) {
        guard rootViewController !== viewController else {
            completion?(false)
            return
        }

        guard duration.isNormal && UIApplication.shared.applicationState == .active else {
            rootViewController?.dismiss(animated: false)
            rootViewController = viewController
            completion?(true)
            return
        }

        CATransaction.begin()
        let src = rootViewController
        let transition = CATransition()
        transition.duration = duration
        transition.type = type
        transition.subtype = subtype
        transition.isRemovedOnCompletion = false
        transition.timingFunction = .init(name: timingFunction)
        transition.fillMode = .both

        if delay > 0.0 {
            let currentTime = CACurrentMediaTime()
            let layerTime = layer.convertTime(currentTime, from: nil)
            transition.beginTime = layerTime + delay
        }

        CATransaction.setCompletionBlock {
            src?.dismiss(animated: false)
            completion?(true)
        }
        
        layer.add(transition, forKey: nil)
        rootViewController = viewController
        CATransaction.commit()
    }
}
