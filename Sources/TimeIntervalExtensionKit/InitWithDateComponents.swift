//
//  InitWithDateComponents.swift
//  TimeIntervalExtensionKit
//
//  Created by Seyed Mojtaba Hosseini Zeidabadi on 8/19/21.
//  Copyright © 2021 Chenzook. All rights reserved.
//
//  StackOverflow: https://stackoverflow.com/story/mojtabahosseini
//  Linkedin: https://linkedin.com/in/MojtabaHosseini
//  GitHub: https://github.com/MojtabaHs
//

import Foundation

public extension TimeInterval {
    /// Creates a new `TimeInterval` representing the duration calculated from the given date components.
    ///
    /// - parameter components: A set of values to add to the date.
    /// - returns: A new `TimeInterval`, or nil if a `TimeInterval` could not be calculated with the given input.
    init?(dateComponents: DateComponents) {
        let origin = Date()
        let calendar = dateComponents.calendar ?? .current
        guard let result = calendar.date(byAdding: dateComponents, to: origin, wrappingComponents: false) else {
            return nil
        }
        self.init(result.timeIntervalSince(origin))
    }
}
