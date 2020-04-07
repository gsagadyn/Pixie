//
//  UIStackView+Subviews.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 07/04/2020.
//

import UIKit

extension UIStackView {
    public func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach(addArrangedSubview)
    }
    
    public func reloadArrangedSubviews(_ subviews: UIView...) {
        guard subviews != arrangedSubviews else { return }
        
        let copy = arrangedSubviews
        
        copy.forEach { $0.removeFromSuperview() }
        copy.forEach(removeArrangedSubview)
        
        subviews.forEach(addArrangedSubview)
    }
}
