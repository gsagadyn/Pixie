//
//  Double+Round.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 13/04/2020.
//

import Foundation

extension Double {
    public func round(to places: Int, rule: NSDecimalNumber.RoundingMode = .bankers) -> Double {
        Decimal(self).round(to: places, rule: rule).doubleValue
    }
}
