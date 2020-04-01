//
//  String+Random.swift
//  Pixie
//
//  Created by Grzegorz Sagadyn on 01/04/2020.
//

import Foundation

extension String {
    private static let alphanumericSource = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    private static let numericSource = "0123456789"
    
    public static func randomAlphanumericString(length: Int = 16) -> String {
        randomString(from: alphanumericSource, length: length)
    }
    
    public static func randomNumericString(length: Int = 16) -> String {
        randomString(from: numericSource, length: length)
    }
    
    public static func randomString(from source: String, length: Int) -> String {
        guard length > 0, !source.isEmpty else { return "" }
        let result = (0..<length).compactMap { _ in source.randomElement() }
        return result.count == length ? String(result) : ""
    }
}
