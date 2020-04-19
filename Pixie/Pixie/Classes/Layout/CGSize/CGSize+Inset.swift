//
//  CGSize+Inset.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 19/04/2020.
//

import UIKit

extension CGSize {
    public func inset(by insets: UIEdgeInsets) -> CGSize {
        self + CGSize(width: insets.width, height: insets.height)
    }
}
