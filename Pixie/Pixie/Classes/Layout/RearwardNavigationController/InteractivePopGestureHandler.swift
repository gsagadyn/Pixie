//
//  InteractivePopGestureHandler.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

internal class InteractivePopGestureHandler: NSObject {
    // MARK: - Private Properties
    
    private weak var parent: RearwardNavigationController?
    
    // MARK: - Initialization
    
    internal init(_ parent: RearwardNavigationController) {
        super.init()
        self.parent = parent
        self.parent?.interactivePopGestureRecognizer?.delegate = self
        self.parent?.interactivePopGestureRecognizer?.addTarget(self, action: #selector(gestureRecognizerAction(_:)))
    }
}


// -----------------------------------------------------------------------------
// MARK: - Gesture Recognizer Delegate
// -----------------------------------------------------------------------------

extension InteractivePopGestureHandler: UIGestureRecognizerDelegate {
    internal func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        let vc = parent?.viewControllers.last as? RearwardableViewController
        let isPopGesture = gestureRecognizer === parent?.interactivePopGestureRecognizer
        let shouldPop = vc?.navigationShouldPopOnInteractivePopGesture() ?? true
        let count = parent?.viewControllers.count ?? 0
        return !isPopGesture || (count > 1 && shouldPop)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Gesture Recognizer Action
// -----------------------------------------------------------------------------

extension InteractivePopGestureHandler {
    private static let rollbackStates: [UIGestureRecognizer.State] = [.cancelled, .failed, .ended]
    
    @objc private func gestureRecognizerAction(_ gestureRecognizer: UIGestureRecognizer) {
        guard gestureRecognizer === parent?.interactivePopGestureRecognizer else { return }
        guard Self.rollbackStates.contains(gestureRecognizer.state) else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            guard let viewController = self.parent?.viewControllers.last else { return }
            self.parent?.interactivePopGestureInterrupted(viewController)
        }
    }
}
