//
//  Application+Version.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import Foundation

extension Application {
    public var version: String {
        let key = "CFBundleShortVersionString"
        let infoDictionary = Bundle.main.infoDictionary
        let result = infoDictionary?[key] as? String
        return result ?? "0.0.0"
    }
    public var build: String {
        let key = "CFBundleVersion"
        let infoDictionary = Bundle.main.infoDictionary
        let result = infoDictionary?[key] as? String
        return result ?? "0"
    }
}
