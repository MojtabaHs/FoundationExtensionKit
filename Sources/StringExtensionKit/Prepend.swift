import Foundation

public extension String {
    func prepending<S: StringProtocol>(_ aString: S) -> String { aString + self }
    mutating func prepend<S: StringProtocol>(_ aString: S) { self = self.prepending(aString) }
}
