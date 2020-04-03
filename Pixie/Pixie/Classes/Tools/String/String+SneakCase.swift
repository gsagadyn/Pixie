//
//  String+SneakCase.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 03/04/2020.
//

import Foundation

extension String {
    private static var uppercaseLetters = CharacterSet.uppercaseLetters
    
    public var snakeCase: String {
        unicodeScalars.reduce("") {
            let isUppercased = Self.uppercaseLetters.contains($1)
            let currentItem = isUppercased ? String($1).lowercased() : String($1)
            let separator = $0.isEmpty || !isUppercased ? "" : "_"
            return "\($0)\(separator)\(currentItem)"
        }
    }
}
