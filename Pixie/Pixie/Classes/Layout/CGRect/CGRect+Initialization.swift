//
//  CGRect+Initialization.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 13/04/2020.
//

import UIKit

extension CGRect {
    public init(origin: CGFloat = 0.0, width: CGFloat, height: CGFloat) {
        self.init(x: origin, y: origin, width: width, height: height)
    }
    
    public init(origin: CGFloat = 0.0, size: CGFloat) {
        self.init(x: origin, y: origin, width: size, height: size)
    }
    
    public init(origin: CGFloat = 0.0, size: CGSize) {
        self.init(x: origin, y: origin, width: size.width, height: size.height)
    }

    public init(origin: Double = 0.0, width: Double, height: Double) {
        self.init(x: origin, y: origin, width: width, height: height)
    }
    
    public init(origin: Double = 0.0, size: Double) {
        self.init(x: origin, y: origin, width: size, height: size)
    }
    
    public init(origin: Double = 0.0, size: CGSize) {
        self.init(x: CGFloat(origin), y: CGFloat(origin), width: size.width, height: size.height)
    }
    
    public init(origin: Int = 0, width: Int, height: Int) {
        self.init(x: origin, y: origin, width: width, height: height)
    }
    
    public init(origin: Int = 0, size: Int) {
        self.init(x: origin, y: origin, width: size, height: size)
    }
    
    public init(origin: Int = 0, size: CGSize) {
        self.init(x: CGFloat(origin), y: CGFloat(origin), width: size.width, height: size.height)
    }
}
