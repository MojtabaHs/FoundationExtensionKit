//
//  PathWithQuery.swift
//  URLExtensionKit
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

@available(OSX 10.11, *)
public extension URL {

    /// Returns the path with all it's query items included.
    var pathWithQuery: String {
        guard let pathRange = components()?.rangeOfPath else { return "" }
        var result = absoluteString
        result.removeSubrange(absoluteString.startIndex...pathRange.lowerBound)
        return result
    }
}
