//
//  UIView+EdgeAnchors.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

extension UIView {
    public func edgeAnchors(to view: UIView, constant: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        return [
            topAnchor.constraint(equalTo: view.topAnchor, constant: constant.top),
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant.left),
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -constant.right),
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -constant.bottom)
        ]
    }
}
