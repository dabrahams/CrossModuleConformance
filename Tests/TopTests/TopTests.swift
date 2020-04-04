import XCTest
@testable import Top

final class TopTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Top().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
