//
//  CharacterSet+Operators.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 01/04/2020.
//

import Foundation

extension CharacterSet {
    public static func + (lhs: CharacterSet, rhs: CharacterSet) -> CharacterSet {
        lhs.union(rhs)
    }
    
    public static func += (lhs: inout CharacterSet, rhs: CharacterSet) {
        lhs = lhs.union(rhs)
    }
    
    public static func - (lhs: CharacterSet, rhs: CharacterSet) -> CharacterSet {
        lhs.subtracting(rhs)
    }
    
    public static func -= (lhs: inout CharacterSet, rhs: CharacterSet) {
        lhs = lhs.subtracting(rhs)
    }
}
