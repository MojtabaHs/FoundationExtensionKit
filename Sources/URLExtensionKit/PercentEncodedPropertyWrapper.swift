//
//  PercentEncoded.swift
//  URLExtensionKit
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 4/29/21.
//  Copyright © 2020 Chenzook. All rights reserved.
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//  Web: https://chenzook.ir
//

import Foundation

@propertyWrapper
/// Extends the URL to be able to be decoded from a string that contains invalid url query components.
public struct PercentEncoded {
    public let allowedCharacters: CharacterSet = .urlQueryAllowed
    private var value: URL

    public var wrappedValue: URL {
        get { value }
        set { value = newValue }
    }
}

extension PercentEncoded: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        let string = try container.decode(String.self)
        guard let percentEncodedString = string.addingPercentEncoding(withAllowedCharacters: allowedCharacters) else {
            throw Error.canNotPercentEncoding(string)
        }

        guard let url = URL(string: percentEncodedString) else {
            throw Error.invalidPercentEncoding(percentEncodedString)
        }

        value = url
    }

    enum Error: Swift.Error {
        case canNotPercentEncoding(String)
        case invalidPercentEncoding(String)
    }
}
