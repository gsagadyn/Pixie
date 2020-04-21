//
//  UIViewController+Embed.swift
//  Pixie
//
//  Created by Kamil Modzelewski on 20/04/2020.
//

import UIKit

public protocol EmbeddedViewControllerAnimator {
    func animate(from: UIViewController?, to: UIViewController?, inside view: UIView, completed: @escaping () -> Void)
}

extension UIViewController {
    public func embed(viewController: UIViewController?, into view: UIView, animated: Bool = false) {
        let animator = DefaultAnimator(animationDuration: animated ? 0.3 : 0.0)
        embed(viewController: viewController, into: view, animator: animator)
    }
    
    public func embed(viewController: UIViewController?, into view: UIView, animator: EmbeddedViewControllerAnimator) {
        view.layer.removeAllAnimations()
        let responders = view.subviews.reversed().map { $0.next }
        let vcs = responders.compactMap(as: UIViewController.self)
        let fromVc = vcs.first(where: { $0.parent != nil })
        let toVc = viewController

        guard fromVc !== toVc else { return }
        
        fromVc?.willMove(toParent: nil)
        fromVc?.removeFromParent()

        toVc?.willMove(toParent: self)
        toVc.map { addChild($0) }
        toVc?.view.frame = view.bounds
        toVc?.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        let onCompleted: () -> Void = {
            fromVc?.parent == nil ? fromVc?.view.removeFromSuperview() : Void()
            toVc?.parent != nil ? toVc?.didMove(toParent: self) : Void()
        }

        animator.animate(from: fromVc, to: toVc, inside: view, completed: onCompleted)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Default Animator
// -----------------------------------------------------------------------------

fileprivate struct DefaultAnimator: EmbeddedViewControllerAnimator {
    // MARK: - Fileprivate Properties
    
    fileprivate let animationDuration: TimeInterval
    
    // MARK: - Embedded View Controller Animator
    
    fileprivate func animate(from: UIViewController?, to: UIViewController?, inside view: UIView, completed: @escaping () -> Void) {
        defer { completed() }
        
        let fromView = from?.view
        fromView?.frame = view.bounds
        fromView.map { view.addSubview($0) }

        let toView = to?.view
        toView?.frame = view.bounds
        toView.map { view.addSubview($0) }

        guard !animationDuration.isZero else { return }
        
        let transition = CATransition()
        transition.duration = animationDuration
        transition.type = .fade
        transition.isRemovedOnCompletion = true
        view.layer.add(transition, forKey: nil)
    }
}
