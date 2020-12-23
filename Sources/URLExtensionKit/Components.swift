//
//  Components.swift
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

public extension URL {

    /// Initialize with the components of a URL.
    ///
    /// If resolvingAgainstBaseURL is `true` and url is a relative URL, the components of url.absoluteURL are used. If the url string from the URL is malformed, nil is returned.
    func components(resolvingAgainstBaseURL: Bool = false) -> URLComponents? {
        URLComponents(url: self, resolvingAgainstBaseURL: resolvingAgainstBaseURL)
    }
}
