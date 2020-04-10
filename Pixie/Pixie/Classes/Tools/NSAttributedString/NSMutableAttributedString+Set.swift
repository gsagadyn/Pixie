//
//  NSMutableAttributedString+Set.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 10/04/2020.
//

import UIKit

extension NSMutableAttributedString {
    public func set(_ attribute: [NSAttributedString.Key: Any], for subString: String) {
        string.ranges(of: subString).forEach { set(attribute, onRange: $0) }
    }
    
    public func set(_ attribute: [NSAttributedString.Key: Any], onRange range: Range<String.Index>) {
        set(attribute, onRange: NSRange(range, in: string))
    }

    public func set(_ attribute: [NSAttributedString.Key: Any], onRange range: NSRange) {
        guard range.location != NSNotFound else { return }
        setAttributes(attribute, range: range)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Foreground Color
// -----------------------------------------------------------------------------

extension NSMutableAttributedString {
    public func set(foregroundColor color: UIColor, for subString: String) {
        set([.foregroundColor: color], for: subString)
    }
    
    public func set(foregroundColor color: UIColor, onRange range: Range<String.Index>) {
        set([.foregroundColor: color], onRange: range)
    }

    public func set(foregroundColor color: UIColor, onRange range: NSRange) {
        set([.foregroundColor: color], onRange: range)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Font
// -----------------------------------------------------------------------------

extension NSMutableAttributedString {
    public func set(font: UIFont, for subString: String) {
        set([.font: font], for: subString)
    }
    
    public func set(font: UIFont, onRange range: Range<String.Index>) {
        set([.font: font], onRange: range)
    }

    public func set(font: UIFont, onRange range: NSRange) {
        set([.font: font], onRange: range)
    }
}

// -----------------------------------------------------------------------------
// MARK: - Background Color
// -----------------------------------------------------------------------------

extension NSMutableAttributedString {
    public func set(backgroundColor color: UIColor, for subString: String) {
        set([.backgroundColor: color], for: subString)
    }
    
    public func set(backgroundColor color: UIColor, onRange range: Range<String.Index>) {
        set([.backgroundColor: color], onRange: range)
    }

    public func set(backgroundColor color: UIColor, onRange range: NSRange) {
        set([.backgroundColor: color], onRange: range)
    }
}
