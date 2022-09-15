import XCTest
@testable import JSONDecoderKit

final class JSONDecoderExtensionKitTests: XCTestCase {

    let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
    
    func testDecodeAnUpperCamelCaseKeyJSON() {
        let json = """
        {"UpperCamelCase": ""}
        """.data(using: .utf8)!

        struct UpperCamelCase: Codable {
            var upperCamelCase: String
        }

        jsonDecoder.keyDecodingStrategy = .convertFromUpperCamelCase
        XCTAssertNoThrow(try jsonDecoder.decode(UpperCamelCase.self, from: json))
    }
    
    ///
    
    func testDecodeAnPascalKebabCaseKeyJSON() {
        let json = """
        {"Pascal-Kebab-Case": ""}
        """.data(using: .utf8)!

        struct UpperCamelCase: Codable {
            var pascalKebabCase: String
        }

        jsonDecoder.keyDecodingStrategy = .convertFromKebabCase
        XCTAssertNoThrow(try jsonDecoder.decode(UpperCamelCase.self, from: json))
    }
    
    func testDecodeAKebabCaseKeyJSON() {
        let json = """
        {"kebab-case": ""}
        """.data(using: .utf8)!

        struct UpperCamelCase: Codable {
            var kebabCase: String
        }

        jsonDecoder.keyDecodingStrategy = .convertFromKebabCase
        XCTAssertNoThrow(try jsonDecoder.decode(UpperCamelCase.self, from: json))
    }
}
