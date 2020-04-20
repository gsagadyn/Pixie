//
//  UIEdgeInsets+Dimensions.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 19/04/2020.
//

import UIKit

extension UIEdgeInsets {
    public var horizontal: CGFloat {
        left + right
    }
    public var vertical: CGFloat {
        top + bottom
    }
}
