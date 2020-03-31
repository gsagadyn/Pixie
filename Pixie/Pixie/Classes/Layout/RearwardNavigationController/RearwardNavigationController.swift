//
//  RearwardNavigationController.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

open class RearwardNavigationController: UINavigationController, UINavigationBarDelegate {
    // MARK: - Private Properties
    
    private var interactivePopGestureHandler: InteractivePopGestureHandler?
    
    // MARK: - View Controller Lifecycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureHandler = InteractivePopGestureHandler(self)
    }
    
    // MARK: - Interactive Pop Gesture Interrupted
    
    open func interactivePopGestureInterrupted(_ restoredViewController: UIViewController) {
        // To override
    }
    
    // MARK: - Navigation Bar Delegate
    
    open func navigationBar(_ navigationBar: UINavigationBar, shouldPop item: UINavigationItem) -> Bool {
        guard viewControllers.count >= (navigationBar.items?.count ?? 0) else { return true }
        let vc = topViewController as? RearwardableViewController
        
        guard !(vc?.navigationShouldPopOnBackButton() ?? true) else {
            DispatchQueue.main.async { self.popViewController(animated: true) }
            return false
        }
        
        let action: (UIView) -> Void = { $0.alpha = 1.0 }
        let views = navigationBar.subviews.filter { $0.alpha < 1.0 }
        views.forEach { view in UIView.animate(withDuration: 0.25, animations: { action(view) }) }
        
        return false
    }
}
