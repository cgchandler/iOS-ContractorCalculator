//
//  String+Shortcuts.swift
//  ContractorCalculator
//
//  Created by Chris Chandler on 11/25/22.
//

import Foundation

// String Extension to verify String value is numeric
// Based on https://sarunw.com/posts/how-to-check-if-string-is-number-in-swift/
extension String {
    var isNumeric: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789.")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}
