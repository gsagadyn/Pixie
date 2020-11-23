//
//  UIApplication+OpenUrl.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import UIKit

extension UIApplication {
    public func canOpen(url: String) -> Bool {
        URL(unsafe: url).map { canOpenURL($0) } ?? false
    }

    public func open(url: String?, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {
        guard let url = URL(unsafe: url) else { return }
        UIApplication.shared.open(url, options: options, completionHandler: completion)
    }
}
