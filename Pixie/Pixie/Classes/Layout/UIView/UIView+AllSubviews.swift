//
//  UIView+AllSubviews.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

extension UIView {
    public var allSubviews: [UIView] {
        UIView.subviews(of: self)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Private Extension
// -----------------------------------------------------------------------------

extension UIView {
    private static func subviews(of view: UIView) -> [UIView] {
        view.subviews + view.subviews.flatMap { subviews(of: $0) }
    }
}
