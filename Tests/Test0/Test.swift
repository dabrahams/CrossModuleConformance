
import XCTest

private final class Test0: XCTestCase {
    func testExample() {
        XCTAssertEqual(ab, ba)
        XCTAssertEqual(idA, idB)
        XCTAssertEqual(ab, idA)
        print("*************", ab, ba, idA, idB, "***************")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
