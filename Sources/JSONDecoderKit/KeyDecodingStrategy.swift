//
//  KeyDecodingStrategy.swift
//  JSONDecoderKit
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 5/25/20.
//  Copyright © 2020 Chenzook. All rights reserved.
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.ir
//

import Foundation

public extension JSONDecoder.KeyDecodingStrategy {
    /// Convert from "UpperCamelCaseKeys" to "camelCaseKeys" before attempting to match a key with the one specified by each type.
    ///
    /// Converting from upper camel case to camel case:
    /// 1. Capitalizes the first word of the key.
    /// 2. Preserve all other letters.
    ///
    /// - Note: Using this key decoding strategy has a nominal performance cost, as each string key has to be inspected for the first letter.
    ///
    /// - Complexity: O(1).
    static var convertFromUpperCamelCase: Self {
        .custom {
            guard let key = $0.last else { fatalError("Keys should not be empty") }

            let codingKeyType = type(of: key)
            let lowerCamelCased = key.stringValue.firstCharLowercased()

            return codingKeyType.init(stringValue: lowerCamelCased)!
        }
    }
}

fileprivate extension String {
    func firstCharLowercased() -> String {
        prefix(1).lowercased() + dropFirst()
    }
}
