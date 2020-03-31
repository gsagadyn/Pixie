//
//  NSAttributedString+Concatenate.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import Foundation

extension NSAttributedString {
    public static func + (lhs: NSAttributedString, rhs: NSAttributedString) -> NSAttributedString {
        let result = NSMutableAttributedString()
        result.append(lhs)
        result.append(rhs)
        return result
    }
    
    public static func += (lhs: inout NSAttributedString, rhs: NSAttributedString) {
        let result = NSMutableAttributedString()
        result.append(lhs)
        result.append(rhs)
        lhs = result
    }
}
