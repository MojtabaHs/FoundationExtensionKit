import XCTest
@testable import JSONDecoderKit

final class StringExtensionKitTests: XCTestCase {

    let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromUpperCamelCase
        return decoder
    }()

    func testDecodeAnUpperCamelCaseKeyJSON() {
        let json = """
        {"UpperCamelCase": ""}
        """.data(using: .utf8)!

        struct UpperCamelCase: Codable {
            var upperCamelCase: String
        }

        XCTAssertNoThrow(try jsonDecoder.decode(UpperCamelCase.self, from: json))
    }
}
