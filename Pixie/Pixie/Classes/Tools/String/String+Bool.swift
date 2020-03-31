//
//  String+Bool.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import Foundation

extension String {
    public var bool: Bool {
        let value = lowercased().components(separatedBy: .whitespacesAndNewlines).joined()
        return ["true", "t", "yes", "y", "1"].contains(where: { value.contains($0) })
    }
}

extension Optional where Wrapped == String {
    public var bool: Bool {
        self?.bool ?? false
    }
}
