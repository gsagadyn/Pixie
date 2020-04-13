//
//  Float+Round.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 13/04/2020.
//

import Foundation

extension Float {
    public func round(to places: Int, rule: NSDecimalNumber.RoundingMode = .bankers) -> Float {
        Decimal(self).round(to: places, rule: rule).floatValue
    }
}
