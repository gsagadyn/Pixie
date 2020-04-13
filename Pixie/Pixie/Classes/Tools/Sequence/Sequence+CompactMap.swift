//
//  Sequence+CompactMap.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 13/04/2020.
//

import Foundation

extension Sequence {
    public func compactMap<T>(as type: T.Type) -> [T] {
        compactMap { $0 as? T }
    }
}
