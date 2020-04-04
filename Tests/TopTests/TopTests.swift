
import XCTest

private final class TopTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(ab, ba)
        print("*************", ab, "***************")
        XCTAssertEqual(idA, idB)
        XCTAssertEqual(ab, idA)
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
