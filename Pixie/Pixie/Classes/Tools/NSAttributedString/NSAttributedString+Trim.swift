//
//  NSAttributedString+Trim.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import Foundation

extension NSAttributedString {
    public func trimmingCharacters(in characterSet: CharacterSet) -> NSAttributedString {
        guard let result = self.mutableCopy() as? NSMutableAttributedString else {
            return self
        }
        
        while let range = result.string.rangeOfCharacter(from: characterSet),
            range.lowerBound == result.string.startIndex {
            let length = result.string.distance(from: range.lowerBound, to: range.upperBound)
            result.deleteCharacters(in: NSRange(location: 0, length: length))
        }
        
        while let range = result.string.rangeOfCharacter(from: characterSet, options: .backwards),
            range.upperBound == result.string.endIndex {
            let location = result.string.distance(from: result.string.startIndex, to: range.lowerBound)
            let length = result.string.distance(from: range.lowerBound, to: range.upperBound)
            result.deleteCharacters(in: NSRange(location: location, length: length))
        }
        return result
    }
}
