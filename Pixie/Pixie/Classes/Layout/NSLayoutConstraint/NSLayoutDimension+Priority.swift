//
//  NSLayoutDimension+Priority.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

extension NSLayoutDimension {
    @objc public func constraint(equalToConstant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalToConstant: c)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(greaterThanOrEqualToConstant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualToConstant: c)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(lessThanOrEqualToConstant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualToConstant: c)
        constraint.priority = priority
        return constraint
    }
    
    @objc public func constraint(equalTo anchor: NSLayoutDimension, multiplier m: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, multiplier: m)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, multiplier: m)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(lessThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, multiplier: m)
        constraint.priority = priority
        return constraint
    }
    
    @objc public func constraint(equalTo anchor: NSLayoutDimension, multiplier m: CGFloat, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(equalTo: anchor, multiplier: m, constant: c)
        constraint.priority = priority
        return constraint
    }

    @objc public func constraint(greaterThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(greaterThanOrEqualTo: anchor, multiplier: m, constant: c)
        constraint.priority = priority
        return constraint
    }
    @objc public func constraint(lessThanOrEqualTo anchor: NSLayoutDimension, multiplier m: CGFloat, constant c: CGFloat, priority: UILayoutPriority) -> NSLayoutConstraint {
        let constraint = self.constraint(lessThanOrEqualTo: anchor, multiplier: m, constant: c)
        constraint.priority = priority
        return constraint
    }
}
