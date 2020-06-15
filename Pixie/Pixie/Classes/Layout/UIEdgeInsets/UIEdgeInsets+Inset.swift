//
//  UIEdgeInsets+Inset.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 15/06/2020.
//

import UIKit

extension UIEdgeInsets {
    public func inset(by insets: UIEdgeInsets) -> UIEdgeInsets {
        self + insets
    }
}
