//
//  UIHostingView.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 09/09/2020.
//

import UIKit
import SwiftUI

@available(iOS 13.0, *)
public final class UIHostingView<Content: View>: UIView {
    // MARK: - Public Properties

    public var rootView: Content { hostingController.rootView }

    // MARK: - Private Properties

    private weak var parentController: UIViewController?
    private let hostingController: UIHostingController<Content>
    private var hostingView: UIView { hostingController.view }

    // MARK: - Initialization

    @available(*, unavailable)
    public required init?(coder: NSCoder) {
        fatalError("init?(coder:) unavailable")
    }

    public init(rootView: Content) {
        hostingController = UIHostingController(rootView: rootView)
        super.init(frame: .zero)
        initialization()
    }

    public override func didMoveToWindow() {
        parentController = parentViewController

        if let parentController = parentViewController {
            parentController.addChild(hostingController)
            hostingController.didMove(toParent: parentController)
        } else {
            hostingController.willMove(toParent: nil)
            hostingController.removeFromParent()
        }
    }
}

// -----------------------------------------------------------------------------
// MARK: - Private Extension
// -----------------------------------------------------------------------------

@available(iOS 13.0, *)
extension UIView {
    fileprivate var parentViewController: UIViewController? {
        if let nextResponder = next as? UIViewController {
            return nextResponder
        } else if let nextResponder = next as? UIView {
            return nextResponder.parentViewController
        } else {
            return nil
        }
    }
}

@available(iOS 13.0, *)
extension UIHostingView {
    private func initialization() {
        hostingView.backgroundColor = .clear
        hostingView.translatesAutoresizingMaskIntoConstraints = false

        addSubview(hostingView)

        NSLayoutConstraint.activate([
            hostingView.topAnchor.constraint(equalTo: topAnchor),
            hostingView.rightAnchor.constraint(equalTo: rightAnchor),
            hostingView.bottomAnchor.constraint(equalTo: bottomAnchor),
            hostingView.leftAnchor.constraint(equalTo: leftAnchor)
        ])
    }
}
