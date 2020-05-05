//
//  UIWindow+RootViewController.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

public protocol RootViewControllerAnimator {
    func animate(from: UIViewController?, to: UIViewController?, inside view: UIView, completed: @escaping () -> Void)
}

extension UIWindow {
    public func setRootViewController(
        _ viewController: UIViewController,
        withAnimationDuration duration: TimeInterval,
        delay: TimeInterval = 0.0,
        options: UIView.AnimationOptions = [.curveEaseInOut],
        completion: ((Bool) -> Void)? = nil) {
        
        let animator = DefaultAnimator(animationDuration: duration, delay: delay, options: options)
        setRootViewController(viewController, animator: animator)
    }

    public func setRootViewController(_ viewController: UIViewController, animator: RootViewControllerAnimator?) {
        let fromVc = rootViewController
        let toVc = viewController

        guard fromVc !== toVc else { return }

        rootViewController = toVc

        guard UIApplication.shared.applicationState == .active else { return }

        let animationView = UIView(frame: toVc.view.bounds)
        animationView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        animationView.backgroundColor = .clear
        toVc.view.addSubview(animationView)

        let onCompleted: () -> Void = {
            animationView.removeFromSuperview()
        }

        animator == nil ? onCompleted() : Void()
        animator?.animate(from: fromVc, to: toVc, inside: animationView, completed: onCompleted)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Default Animator
// -----------------------------------------------------------------------------

fileprivate struct DefaultAnimator: RootViewControllerAnimator {
    // MARK: - Fileprivate Properties

    fileprivate let animationDuration: TimeInterval
    fileprivate let delay: TimeInterval
    fileprivate let options: UIView.AnimationOptions

    // MARK: - Embedded View Controller Animator

    fileprivate func animate(from: UIViewController?, to: UIViewController?, inside view: UIView, completed: @escaping () -> Void) {
        guard let fromView = from?.view, !animationDuration.isZero else {
            completed()
            return
        }

        let snapshot = fromView.snapshotView(afterScreenUpdates: true) ?? UIView(frame: fromView.bounds)
        view.addSubview(snapshot)

        UIView.animate(withDuration: animationDuration, delay: delay, options: options, animations: {
            snapshot.alpha = 0.0
        }, completion: { _ in
            completed()
        })
    }
}
