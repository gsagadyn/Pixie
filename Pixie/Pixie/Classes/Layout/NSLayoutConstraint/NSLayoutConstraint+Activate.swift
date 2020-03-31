//
//  NSLayoutConstraint+Activate.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

extension NSLayoutConstraint {
    public static func activate(_ constraints: NSLayoutConstraint?...) {
        NSLayoutConstraint.activate(constraints.compactMap { $0 })
    }
}
