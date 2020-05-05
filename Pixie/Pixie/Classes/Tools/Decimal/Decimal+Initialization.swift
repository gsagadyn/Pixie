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
        let pointers = CharacterSet(charactersIn: ",.")
        let components = posix.components(separatedBy: pointers)
        guard components.count <= 2 else { return nil }
        
        let allowedCharacter = pointers + .init(charactersIn: "0123456789")
        let trimmed = posix.components(separatedBy: allowedCharacter.inverted)
        let value = trimmed.joined().replacingOccurrences(of: ",", with: ".")
        let locale = Locale(identifier: "en_US_POSIX")
        self.init(string: value, locale: locale)
    }
}
