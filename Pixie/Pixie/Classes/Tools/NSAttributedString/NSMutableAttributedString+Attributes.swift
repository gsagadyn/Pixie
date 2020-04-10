//
//  NSMutableAttributedString+Attributes.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 10/04/2020.
//

import UIKit

extension NSMutableAttributedString {
    public func set(_ attributes: [NSAttributedString.Key: Any], for subString: String) {
        string.ranges(of: subString).forEach { set(attributes, onRange: $0) }
    }
    
    public func set(_ attributes: [NSAttributedString.Key: Any], onRange range: Range<String.Index>) {
        set(attributes, onRange: NSRange(range, in: string))
    }

    public func set(_ attributes: [NSAttributedString.Key: Any], onRange range: NSRange) {
        guard range.location != NSNotFound else { return }
        setAttributes(attributes, range: range)
    }
    
    public func add(_ attributes: [NSAttributedString.Key: Any], for subString: String) {
        string.ranges(of: subString).forEach { add(attributes, onRange: $0) }
    }
    
    public func add(_ attributes: [NSAttributedString.Key: Any], onRange range: Range<String.Index>) {
        add(attributes, onRange: NSRange(range, in: string))
    }

    public func add(_ attributes: [NSAttributedString.Key: Any], onRange range: NSRange) {
        guard range.location != NSNotFound else { return }
        addAttributes(attributes, range: range)
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
    
    public func add(foregroundColor color: UIColor, for subString: String) {
        add([.foregroundColor: color], for: subString)
    }
    
    public func add(foregroundColor color: UIColor, onRange range: Range<String.Index>) {
        add([.foregroundColor: color], onRange: range)
    }

    public func add(foregroundColor color: UIColor, onRange range: NSRange) {
        add([.foregroundColor: color], onRange: range)
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
    
    public func add(font: UIFont, for subString: String) {
        add([.font: font], for: subString)
    }
    
    public func add(font: UIFont, onRange range: Range<String.Index>) {
        add([.font: font], onRange: range)
    }

    public func add(font: UIFont, onRange range: NSRange) {
        add([.font: font], onRange: range)
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
    
    public func add(backgroundColor color: UIColor, for subString: String) {
        add([.backgroundColor: color], for: subString)
    }
    
    public func add(backgroundColor color: UIColor, onRange range: Range<String.Index>) {
        add([.backgroundColor: color], onRange: range)
    }

    public func add(backgroundColor color: UIColor, onRange range: NSRange) {
        add([.backgroundColor: color], onRange: range)
    }
}
