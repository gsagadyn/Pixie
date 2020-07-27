//
//  Decimal+Initialization.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 13/04/2020.
//

import Foundation

extension Decimal {
    public init(_ value: Float) {
        self = NSDecimalNumber(value: value).decimalValue
    }

    public init?(posix: String?) {
        guard let posix = posix else { return nil }
        let locale = Locale(identifier: "en_US_POSIX")

        let numberFormatter = NumberFormatter()
        numberFormatter.locale = locale

        let minusSign = numberFormatter.minusSign ?? ""
        let decimalSeparator = numberFormatter.decimalSeparator ?? ""
        let pointers = CharacterSet(charactersIn: "\(decimalSeparator),.")
        let allowedCharacters = pointers + .init(charactersIn: "\(minusSign)-0123456789")

        let trimmed = posix.components(separatedBy: allowedCharacters.inverted)
        let components = trimmed.joined().components(separatedBy: pointers)
        guard components.count <= 2 else { return nil }
        self.init(string: components.joined(separator: "."), locale: locale)
    }
}
