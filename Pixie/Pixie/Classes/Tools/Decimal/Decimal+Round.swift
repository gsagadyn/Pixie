//
//  Decimal+Round.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 13/04/2020.
//

import Foundation

extension Decimal {
    public func round(to places: Int, rule: NSDecimalNumber.RoundingMode = .bankers) -> Decimal {
        var value = self
        var result = Decimal()
        NSDecimalRound(&result, &value, places, rule)
        return NSDecimalNumber(decimal: result).decimalValue
    }
}
