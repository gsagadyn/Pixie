//
//  IconStringConvertible.swift
//  Pixie
//
//  Created by Kamil Modzelewski on 30/09/2020.
//

import UIKit

public protocol IconStringConvertible: CustomStringConvertible {
    var icon: UIImage? { get }
}
