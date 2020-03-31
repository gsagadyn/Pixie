//
//  UIApplication+VisibleViewController.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

extension UIApplication {
    public var headViewController: UIViewController? {
        guard let window = keyWindow else { return nil }
        guard let vc = window.rootViewController else { return nil }
        return vc.visibleViewController
    }
}
