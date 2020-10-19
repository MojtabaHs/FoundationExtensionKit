//
//  Unwrapped.swift
//  OptionalExtensionKit
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 5/25/20.
//  Copyright © 2020 Chenzook. All rights reserved.
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.ir
//

public extension Optional {
    /// The wrapped value of this instance, unwrapped with checking whether
    /// the instance is `nil`.
    ///
    /// This function throws an error if the instance is `nil`.
    func unwrapped() throws -> Wrapped {
        guard let value = self else { throw Error.foundNilWhileUnwrapping }
        return value
    }
}
