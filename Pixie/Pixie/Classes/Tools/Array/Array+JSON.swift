//
//  Array+JSON.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 09/04/2020.
//

import Foundation

extension Array {
    public var isValidJson: Bool {
        jsonData != nil
    }
    public var jsonData: Data? {
        try? JSONSerialization.data(withJSONObject: self, options: [.prettyPrinted])
    }
}
