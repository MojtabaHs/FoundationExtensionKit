//
//  Errors.swift
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
    enum Error: Swift.Error  {
        case foundNilWhileUnwrapping
    }
}
