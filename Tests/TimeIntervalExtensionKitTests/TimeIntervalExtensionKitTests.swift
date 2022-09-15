import XCTest
@testable import TimeIntervalExtensionKit

final class TimeIntervalExtensionKitTests: XCTestCase {
    var testCasesForCreatingTimeIntervalsUsingDateComponents = [
        (input: DateComponents(second: 5)           , expectation: TimeInterval(5)),
        (input: DateComponents(second: 100)         , expectation: TimeInterval(100)),
        (input: DateComponents(minute: 5)           , expectation: TimeInterval(5 * 60)),
        (input: DateComponents(minute:5, second: 5) , expectation: TimeInterval((5 * 60) + 5)),
        (input: DateComponents(hour: 2)             , expectation: TimeInterval(2 * 60 * 60))
    ]

    func testCreatingTimeIntervalsUsingDateComponents() {
        for testCase in testCasesForCreatingTimeIntervalsUsingDateComponents {
            let toTest = TimeInterval(dateComponents: testCase.input)
            XCTAssertEqual(toTest, testCase.expectation)
        }
    }
}
