import XCTest
@testable import OptionalExtensionKit

final class OptionalExtensionKitTests: XCTestCase {

    func testUnwrappingNilInstance() {
        let instance: Any? = nil
        XCTAssertThrowsError(try instance.unwrapped())
    }

    func testUnwrappingNotNilInstance() {
        let instance: Any? = "Some Value"
        XCTAssertNoThrow(try instance.unwrapped())
    }

    func testNilOptionalString() {
        let text: String? = nil
        XCTAssertFalse(text.hasValue)
    }

    func testEmptyOptionalString() {
        let text: String? = ""
        XCTAssertFalse(text.hasValue)
    }

    func testNotEmptyOptionalString() {
        let text: String? = "Some Value"
        XCTAssert(text.hasValue)
    }
}
