//
//  UserDefaults+Erase.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 04/05/2020.
//

import Foundation

extension UserDefaults {
    public static func erase() {
        let identifier = Bundle.main.bundleIdentifier
        identifier.map { standard.removePersistentDomain(forName: $0) }
        standard.synchronize()
    }
}
