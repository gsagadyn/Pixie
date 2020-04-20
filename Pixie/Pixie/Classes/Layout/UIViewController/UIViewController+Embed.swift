//
//  UIViewController+Embed.swift
//  Pixie
//
//  Created by Kamil Modzelewski on 20/04/2020.
//

import UIKit

extension UIViewController {
    public func embed(viewController: UIViewController, into view: UIView, animated: Bool = false) {
        defer { viewController.didMove(toParent: self) }
        viewController.willMove(toParent: self)

        addChild(viewController)
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        let action = { view.addSubview(viewController.view) }
        let animationOptions: UIView.AnimationOptions = [.transitionCrossDissolve, .curveEaseInOut]
        animated ? UIView.transition(with: view, duration: 0.25, options: animationOptions, animations: action) : action()
    }
    
    public func unembed(viewController: UIViewController, from view: UIView, animated: Bool = false) {
        defer { viewController.didMove(toParent: nil) }
        viewController.willMove(toParent: nil)
        viewController.removeFromParent()

        let action = { viewController.view.removeFromSuperview() }
        let animationOptions: UIView.AnimationOptions = [.transitionCrossDissolve, .curveEaseInOut]
        animated ? UIView.transition(with: view, duration: 0.25, options: animationOptions, animations: action) : action()
    }
}
