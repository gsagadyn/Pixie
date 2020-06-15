//
//  String+CapitalizedFirst.swift
//  Pixie
//
//  Created by Kamil Modzelewski on 05/06/2020.
//

import Foundation

extension String {
    public var capitalizedFirst: Self {
        prefix(1).capitalized + dropFirst()
    }
}
