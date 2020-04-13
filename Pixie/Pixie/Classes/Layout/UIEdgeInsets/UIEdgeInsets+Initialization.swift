//
//  UIEdgeInsets+Initialization.swift
//  Pixie
//
//  Created by Kamil Modzelewski on 13/04/2020.
//

import UIKit

extension UIEdgeInsets {
    public init(_ all: CGFloat) {
        self.init(top: all, left: all, bottom: all, right: all)
    }
    
    public init(vertical: CGFloat = 0.0, horizontal: CGFloat = 0.0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    public init(top: CGFloat, other: CGFloat = 0.0) {
        self.init(top: top, left: other, bottom: other, right: other)
    }
    
    public init(left: CGFloat, other: CGFloat = 0.0) {
        self.init(top: other, left: left, bottom: other, right: other)
    }
    
    public init(bottom: CGFloat, other: CGFloat = 0.0) {
        self.init(top: other, left: other, bottom: bottom, right: other)
    }
    
    public init(right: CGFloat, other: CGFloat = 0.0) {
        self.init(top: other, left: other, bottom: other, right: right)
    }
}
