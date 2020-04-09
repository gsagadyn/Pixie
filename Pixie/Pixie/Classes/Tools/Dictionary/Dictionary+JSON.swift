//
//  Dictionary+JSON.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 09/04/2020.
//

import Foundation

extension Dictionary {
    public var isValidJson: Bool {
        jsonData != nil
    }
    public var jsonData: Data? {
        try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
    }
}
