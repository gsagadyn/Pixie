//
//  Collection+FilterNil.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 13/04/2020.
//

import Foundation

extension Sequence where Iterator.Element: OptionalType {
    public func filterNil() -> [Iterator.Element.Wrapped] {
        compactMap { $0.map { $0 } }
    }
}
