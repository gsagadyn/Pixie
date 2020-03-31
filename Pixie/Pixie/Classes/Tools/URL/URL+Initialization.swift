//
//  URL+Initialization.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 31/03/2020.
//

import Foundation

extension URL {
    public init?(unsafe: String?) {
        guard let value = unsafe else { return nil }
        let escaped = value.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? value
        guard let url = URL(string: value) ?? URL(string: escaped) else { return nil }
        self = url
    }
}
