//
//  ClippingCharacters.swift
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
    /// Removes any appearance of any characters in the character set.
    /// - Parameter characterSet: Characters to be removed.
    /// - Returns: Removed characters version of the string
    func clippingCharacters(in characterSet: CharacterSet) -> String {
        components(separatedBy: characterSet).joined()
    }
}
