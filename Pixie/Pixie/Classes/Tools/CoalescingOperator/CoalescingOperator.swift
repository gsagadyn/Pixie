//
//  CoalescingOperator.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 01/04/2020.
//

import Foundation

infix operator ??=

public func ??= <T>(left: inout T?, right: T?) {
    left = left ?? right
}
