//
//  UIView+Parallax.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 17/04/2020.
//

import UIKit

extension UIView {
    private static let centerX = "center.x"
    private static let centerY = "center.y"

    public var parallax: CGFloat {
        get {
            let motionEffects = parallaxMotionEffect?.motionEffects ?? []
            let effect = motionEffects.first as? UIInterpolatingMotionEffect
            return (effect?.minimumRelativeValue as? CGFloat) ?? 0.0
        }
        set {
            parallaxMotionEffect.map { removeMotionEffect($0) }
            guard newValue > 0.0 else { return }
            
            let horizontal = UIInterpolatingMotionEffect(keyPath: Self.centerX, type: .tiltAlongHorizontalAxis)
            horizontal.minimumRelativeValue = -newValue
            horizontal.maximumRelativeValue = newValue

            let vertical = UIInterpolatingMotionEffect(keyPath: Self.centerY, type: .tiltAlongVerticalAxis)
            vertical.minimumRelativeValue = -newValue
            vertical.maximumRelativeValue = newValue

            let group = UIMotionEffectGroup()
            group.motionEffects = [horizontal, vertical]
            addMotionEffect(group)
        }
    }
}

// -----------------------------------------------------------------------------
// MARK: - Private Extension
// -----------------------------------------------------------------------------

extension UIView {
    private var parallaxMotionEffect: UIMotionEffectGroup? {
        motionEffects.compactMap(as: UIMotionEffectGroup.self).first { effect -> Bool in
            typealias EffectsGroup = (UIInterpolatingMotionEffect, UIInterpolatingMotionEffect)
            guard let subeffects = effect.motionEffects, subeffects.count == 2 else { return false }
            guard let group = (subeffects[0], subeffects[1]) as? EffectsGroup else { return false }
            return Set([Self.centerX, Self.centerY]) == Set([group.0.keyPath, group.1.keyPath])
        }
    }
}
