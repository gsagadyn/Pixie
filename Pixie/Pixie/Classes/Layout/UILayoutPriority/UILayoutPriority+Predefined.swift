//
//  UILayoutPriority+Predefined.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

extension UILayoutPriority {
    /// Required but breakable
    public static let imperative = UILayoutPriority(rawValue: UILayoutPriority.required.rawValue - 0.1)
    
    /// DefaultHigh + 100.0
    public static let upperHigh = UILayoutPriority(rawValue: UILayoutPriority.defaultHigh.rawValue + 100.0)
    
    /// DefaultHigh - 100.0
    public static let lowerHigh = UILayoutPriority(rawValue: UILayoutPriority.defaultHigh.rawValue - 100.0)
    
    /// 500.0
    public static let medium = UILayoutPriority(rawValue: 500.0)
    
    /// DefaultLow + 100.0
    public static let upperLow = UILayoutPriority(rawValue: UILayoutPriority.defaultLow.rawValue + 100.0)
    
    /// DefaultLow - 100.0
    public static let lowerLow = UILayoutPriority(rawValue: UILayoutPriority.defaultLow.rawValue - 100.0)
    
    /// 0.1
    public static let optional = UILayoutPriority(rawValue: 0.1)
}
