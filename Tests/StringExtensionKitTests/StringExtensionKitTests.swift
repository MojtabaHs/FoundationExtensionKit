import XCTest
@testable import StringExtensionKit

final class StringExtensionKitTests: XCTestCase {
    var testCasesForRemovingAllCharactersAllButDigits = [
        (input: "Hello 1234 Number", expectation: "1234"),
        (input: "Hello ۱۲۳۴ Number", expectation: "۱۲۳۴"),
        (input: "Hello 12۳۴ Number", expectation: "12۳۴"),
        (input: "☺️ 1234 😛"       , expectation: "1234"),
        (input: "\n 1234 \n"       , expectation: "1234")
    ]

    func testRemovingAllCharactersButDigits() {
        for testCase in testCasesForRemovingAllCharactersAllButDigits {
            let toTest = testCase.input.clippingCharacters(in: CharacterSet.decimalDigits.inverted)
            XCTAssertEqual(toTest, testCase.expectation)
        }
    }

    ///

    var testCasesForRemovingDigits = [
        (input: "Hello 1234 Number", expectation: "Hello  Number"),
        (input: "Hello ۱۲۳۴ Number", expectation: "Hello  Number"),
        (input: "Hello 12۳۴ Number", expectation: "Hello  Number"),
        (input: "☺️ 1234 😛"       , expectation: "☺️  😛"),
        (input: "\n 1234 \n"       , expectation: "\n  \n")
    ]

    func testRemovingAllDigits() {
        for testCase in testCasesForRemovingDigits {
            let toTest = testCase.input.clippingCharacters(in: CharacterSet.decimalDigits)
            XCTAssertEqual(toTest, testCase.expectation)
        }
    }

    ///

    var testCasesConvertingAllDigitsToEnglish = [
        (input: "۰۱۲۳۴۵۶۷۸"       , expectation: "012345678"),
        (input: "۰1۲3۴5۶7۸"       , expectation: "012345678"),
        (input: "Hello ۰۱۲۳۴۵۶۷۸" , expectation: "Hello 012345678"),
        (input: "سلام ۰۱۲۳۴۵۶۷۸۹"  , expectation: "سلام 0123456789"),
        (input: "0000۰۰۰۰"        , expectation: "00000000"),
        (input: "سلام"             , expectation: "سلام"),
        (input: "Hello"           , expectation: "Hello"),
    ]

    func testConvertingAllDigitsToEnglish() {
        for testCase in testCasesConvertingAllDigitsToEnglish {
            let toTest = testCase.input.convertedDigitsToLocale(Locale(identifier: "En"))
            XCTAssertEqual(toTest, testCase.expectation)
        }
    }

    ///

    var testCasesConvertingAllDigitsToPersian = [
        (input: "۰۱۲۳۴۵۶۷۸۹"        , expectation: "۰۱۲۳۴۵۶۷۸۹"),
        (input: "۰1۲3۴5۶7۸9"        , expectation: "۰۱۲۳۴۵۶۷۸۹"),
        (input: "Hello ۰۱۲۳۴۵۶۷۸۹"  , expectation: "Hello ۰۱۲۳۴۵۶۷۸۹"),
        (input: "Hello 0123456789" , expectation: "Hello ۰۱۲۳۴۵۶۷۸۹"),
        (input: "سلام ۰۱۲۳۴۵۶۷۸۹"    , expectation: "سلام ۰۱۲۳۴۵۶۷۸۹"),
        (input: "سلام 0123456789"    , expectation: "سلام ۰۱۲۳۴۵۶۷۸۹"),
        (input: "0000۰۰۰۰"          , expectation: "۰۰۰۰۰۰۰۰"),
        (input: "سلام"               , expectation: "سلام"),
        (input: "Hello"             , expectation: "Hello"),
    ]

    func testConvertingAllDigitsToPersian() {
        for testCase in testCasesConvertingAllDigitsToPersian {
            let toTest = testCase.input.convertedDigitsToLocale(Locale(identifier: "Fa"))
            XCTAssertEqual(toTest, testCase.expectation)
        }
    }

    ///

    func testConvertingAllDigitsToEnglishUsingLocalIdentifier() {
        for testCase in testCasesConvertingAllDigitsToEnglish {
            let toTest = testCase.input.convertedDigitsToLocale(identifier: "En")
            XCTAssertEqual(toTest, testCase.expectation)
        }
    }

    ///

    func testConvertingAllDigitsToPersianUsingLocalIdentifier() {
        for testCase in testCasesConvertingAllDigitsToPersian {
            let toTest = testCase.input.convertedDigitsToLocale(identifier: "Fa")
            XCTAssertEqual(toTest, testCase.expectation)
        }
    }
    
    ///

    var testCasesReplacingPrefix = [
        (initial: "Hello world", prefix: "Hello", replacingWith: "Goodbye", expectation: "Goodbye world"),
        (initial: "سلام دنیا", prefix: "سلام", replacingWith: "خدا نگهدار", expectation: "خدا نگهدار دنیا"),
    ]

    func testRemovingPrefix() {
        for testCase in testCasesReplacingPrefix {
            let toTest = testCase.initial.replacing(prefix: testCase.prefix, with: testCase.replacingWith)
            XCTAssertEqual(toTest, testCase.expectation)
        }
    }

    func testRemovePrefix() {
        for testCase in testCasesReplacingPrefix {
            var toTest = testCase.initial
            toTest.replace(prefix: testCase.prefix, with: testCase.replacingWith)
            XCTAssertEqual(toTest, testCase.expectation)
        }
    }
    
    ///

    var testCasesPrepending = [
        (initial: "world", prefix: "Hello ", expectation: "Hello world"),
    ]

    func testPrepending() {
        for testCase in testCasesPrepending {
            let toTest = testCase.initial.prepending(testCase.prefix)
            XCTAssertEqual(toTest, testCase.expectation)
        }
    }

    func testPrependMutation() {
        for testCase in testCasesPrepending {
            var toTest = testCase.initial
            toTest.prepend(testCase.prefix)
            XCTAssertEqual(toTest, testCase.expectation)
        }
    }
}
