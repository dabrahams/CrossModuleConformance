
import XCTest

private final class Test2: XCTestCase {
    func testExample() {
        // Fails if we comment out "import A" in AB.swift
        XCTAssertEqual(ab, ba)
        // Fails if we comment out "import A" in AB.swift
        XCTAssertEqual(idA, idB)
        // Apparently always succeeds.
        XCTAssertEqual(ab, idA)
        // Let's see which value we get when everything passes.
        print("*************", ab, "***************")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
