//
//  String+Range.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 10/04/2020.
//

import Foundation

extension String {
    public func ranges(of searchString: String) -> [Range<String.Index>] {
        let indices = self.indices(of: searchString)
        let count = searchString.count
        return indices.map { index(startIndex, offsetBy: $0)..<index(startIndex, offsetBy: $0 + count) }
    }
    
    public func indices(of searchString: String) -> [Int] {
        var indices = [Int]()
        var position = startIndex
        
        while let range = range(of: searchString, range: position..<endIndex) {
            let distance = self.distance(from: startIndex, to: range.lowerBound)
            let offset = searchString.distance(from: searchString.startIndex, to: searchString.endIndex) - 1
            let after = index(range.lowerBound, offsetBy: offset, limitedBy: endIndex)
            indices.append(distance)
            
            guard after != nil else { break }
            after.map { position = index(after: $0) }
        }
        
        return indices
    }
}
