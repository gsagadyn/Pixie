//
//  CGSize+MinMax.swift
//  Pixie
//
//  Created by Kamil Modzelewski on 15/04/2020.
//

import UIKit

extension CGSize {
    public var min: CGFloat {
        Swift.min(width, height)
    }
    public var max: CGFloat {
        Swift.max(width, height)
    }
}
