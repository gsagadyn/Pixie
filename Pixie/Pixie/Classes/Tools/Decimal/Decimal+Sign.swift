//
//  Decimal+Sign.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import Foundation

extension Decimal {
    public var isPositive: Bool {
        !isSignMinus && !isZero
    }
    public var isNegative: Bool {
        isSignMinus
    }
}
