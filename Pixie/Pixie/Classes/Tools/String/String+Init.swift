//
//  String+Init.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import Foundation

extension String {
    public init?(_ substring: String.SubSequence?) {
        guard let substring = substring else { return nil }
        self.init(substring)
    }
}
