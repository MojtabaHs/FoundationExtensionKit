import Foundation

public extension JSONDecoder.KeyDecodingStrategy {
    /// Convert from "KEBAB-CASE-KEYS" (or "kebab-case-keys") to "camelCaseKeys" before attempting to match a key with the one specified by each type.
    ///
    /// The conversion to upper case uses `Locale.system`, also known as the ICU "root" locale. This means the result is consistent regardless of the current user's locale and language preferences.
    ///
    /// Converting from kebab case to camel case:
    /// 1. Capitalizes the word starting after each `-`
    /// 2. Removes all `-`
    /// For example, `one-two-three` becomes `oneTwoThree`. `ONE-TWO-THREE` becomes `oneTwoThree`.
    ///
    /// - Note: Using a key decoding strategy has a nominal performance cost, as each string key has to be inspected for the `-` character.
    static let convertFromKebabCase = JSONDecoder.KeyDecodingStrategy.custom { keys in
        // Should never receive an empty `keys` array in theory.
        guard let lastKey = keys.last else { return AnyKey.empty }

        // Represents an array index.
        guard lastKey.intValue == nil else { return lastKey }

        let components = lastKey.stringValue.split(separator: "-")
        guard let firstComponent = components.first?.lowercased() else { return lastKey }

        let trailingComponents = components.dropFirst().map { $0.capitalized }
        let lowerCamelCaseKey = ([firstComponent] + trailingComponents).joined()
        return AnyKey(string: lowerCamelCaseKey)
    }
}

/// A helper struct for custom json decoder key decoding strategy
private struct AnyKey: CodingKey {
    static let empty = AnyKey(string: "")

    var stringValue: String
    var intValue: Int?

    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }

    init?(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }

    init(string: String) {
        self.stringValue = string
        self.intValue = nil
    }
}
