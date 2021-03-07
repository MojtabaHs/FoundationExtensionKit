//
//  ReplacingPrefix.swift
//  StringExtensionKit
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 7/4/20.
//  Copyright © 2020 Chenzook. All rights reserved.
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.ir
//

import Foundation

public extension String {
    /// Returns a new string in which occurrence of a target string at the prefix of the string are replaced by another given string.
    /// - Parameters:
    ///   - prefix: The string at the beginning of the string that should be replaced.
    ///   - replacement: The the string that the prefix should be replaced with.
    /// - Returns: A new string in which occurrence of a target string at the prefix of the string are replaced by another given string.
    func replacing(prefix: String, with replacement: String) -> String {
        guard hasPrefix(prefix) else { return self }
        return replacement + self[prefix.endIndex...]
    }

    /// Replaces occurrence of a target string at the prefix of the string with another given string.
    /// - Parameters:
    ///   - prefix: The string at the beginning of the string that should be replaced.
    ///   - replacement: The the string that the prefix should be replaced with.
    mutating func replace(prefix: String, with replacement: String) {
        self = replacing(prefix: prefix, with: replacement)
    }
}
