//
//  UIColor+Hex.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 08/04/2020.
//

import UIKit

private let allowedCharacterSet = CharacterSet.alphanumerics

extension UIColor {
    public convenience init(hexString: String, default: UIColor = .clear) {
        let hexString = hexString.components(separatedBy: allowedCharacterSet.inverted).joined()
        
        var int = UInt64()
        Scanner(string: hexString).scanHexInt64(&int)
        
        var result: (a: UInt64, r: UInt64, g: UInt64, b: UInt64)
        switch hexString.count {
        case 3:
            result = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            result = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            result = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            let color = `default`.ciColor
            let a = UInt64(color.alpha * 255.0)
            let r = UInt64(color.red * 255.0)
            let g = UInt64(color.green * 255.0)
            let b = UInt64(color.blue * 255.0)
            result = (a, r, g, b)
        }
        
        self.init(
            red: CGFloat(result.r) / 255.0,
            green: CGFloat(result.g) / 255.0,
            blue: CGFloat(result.b) / 255.0,
            alpha: CGFloat(result.a) / 255.0
        )
    }
}
