//
//  NSLayoutYAxisAnchor+Priority.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

extension NSLayoutYAxisAnchor {
    @objc public func constraint(equalToSystemSpacingBelow anchor: NSLayoutYAxisAnchor, multiplier: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalToSystemSpacingBelow: anchor, multiplier: multiplier)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(greaterThanOrEqualToSystemSpacingBelow anchor: NSLayoutYAxisAnchor, multiplier: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualToSystemSpacingBelow: anchor, multiplier: multiplier)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(lessThanOrEqualToSystemSpacingBelow anchor: NSLayoutYAxisAnchor, multiplier: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualToSystemSpacingBelow: anchor, multiplier: multiplier)
        constraint.priority = priority
        return constraint
    }
    
    @objc public func constraint(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor)
        constraint.priority = priority
        return constraint
    }
    
    @objc public func constraint(equalTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, constant: c)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(greaterThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, constant: c)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(lessThanOrEqualTo anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, constant: c)
        constraint.priority = priority
        return constraint
    }
}
