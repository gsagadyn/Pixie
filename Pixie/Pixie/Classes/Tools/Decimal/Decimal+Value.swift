//
//  Decimal+Value.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import Foundation

extension Decimal {
    public var doubleValue: Double {
        NSDecimalNumber(decimal: self).doubleValue
    }
    public var floatValue: Float {
        NSDecimalNumber(decimal: self).floatValue
    }
    public var intValue: Int {
        NSDecimalNumber(decimal: self).intValue
    }
}
