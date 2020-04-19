//
//  UIEdgeInsets+Dimensions.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 19/04/2020.
//

import UIKit

import UIKit

extension UIEdgeInsets {
    public var width: CGFloat {
        left + right
    }
    public var height: CGFloat {
        top + bottom
    }
}
