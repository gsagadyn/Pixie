//
//  String+Trim.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import Foundation

extension String {
    public func trimLeft(_ characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        String(self.drop(while: { characterSet.isSuperset(of: CharacterSet(charactersIn: String($0))) }))
    }
    
    public func removePrefix(_ prefix: String) -> String {
        hasPrefix(prefix) ? String(dropFirst(prefix.count)) : self
    }
    
    public func removeSuffix(_ suffix: String) -> String {
        hasSuffix(suffix) ? String(dropLast(suffix.count)) : self
    }
    
    public func trim(extended: Bool = false) -> String {
        let characterSet = CharacterSet.whitespacesAndNewlines
        guard extended else { return trimmingCharacters(in: characterSet) }
        let components = self.components(separatedBy: characterSet)
        return components.filter({ !String($0).isEmpty }).joined(separator: " ")
    }
}
