//
//  OptionalType.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 13/04/2020.
//

import Foundation

public protocol OptionalType {
    associatedtype Wrapped
    
    func map<U>(_ f: (Wrapped) throws -> U) rethrows -> U?
}

extension Optional: OptionalType { }
