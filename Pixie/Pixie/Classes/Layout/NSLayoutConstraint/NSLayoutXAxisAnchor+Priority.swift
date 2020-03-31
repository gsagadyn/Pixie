//
//  NSLayoutXAxisAnchor+Priority.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

extension NSLayoutXAxisAnchor {
    @objc public func constraint(equalToSystemSpacingAfter anchor: NSLayoutXAxisAnchor, multiplier: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalToSystemSpacingAfter: anchor, multiplier: multiplier)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(greaterThanOrEqualToSystemSpacingAfter anchor: NSLayoutXAxisAnchor, multiplier: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(lessThanOrEqualToSystemSpacingAfter anchor: NSLayoutXAxisAnchor, multiplier: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualToSystemSpacingAfter: anchor, multiplier: multiplier)
        constraint.priority = priority
        return constraint
    }
}
