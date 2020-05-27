//
//  UIScrollView+ScrollToDirection.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 27/05/2020.
//

import UIKit

extension UIScrollView {
    public enum ScrollDirection {
        case top
        case right
        case bottom
        case left
    }

    public func scrollTo(direction: ScrollDirection, animated: Bool = true) {
        let contentInset = UIEdgeInsets(
            top: max(self.contentInset.top, adjustedContentInset.top),
            left: max(self.contentInset.left, adjustedContentInset.left),
            bottom: max(self.contentInset.bottom, adjustedContentInset.bottom),
            right: max(self.contentInset.right, adjustedContentInset.right)
        )

        var result = CGPoint.zero
        switch direction {
        case .top:
            result = CGPoint(x: contentOffset.x, y: -contentInset.top)
        case .right:
            let x = contentSize.width - bounds.width + contentInset.right
            result = CGPoint(x: max(x, -contentInset.left), y: contentOffset.y)
        case .bottom:
            let y = contentSize.height - bounds.height + contentInset.bottom
            result = CGPoint(x: contentOffset.x, y: max(y, -contentInset.top))
        case .left:
            result = CGPoint(x: -contentInset.left, y: contentOffset.y)
        }

        setContentOffset(result, animated: animated)
    }
}
