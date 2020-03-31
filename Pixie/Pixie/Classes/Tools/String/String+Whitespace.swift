//
//  String+Whitespace.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import Foundation

extension String {
    public var isWhitespace: Bool {
        components(separatedBy: .whitespacesAndNewlines).joined().isEmpty
    }
}

extension Optional where Wrapped == String {
    public var isNilOrWhitespace: Bool {
        self?.isWhitespace ?? true
    }
}
