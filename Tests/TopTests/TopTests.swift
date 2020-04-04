
import XCTest

private final class TopTests: XCTestCase {
    func testExample() {
        XCTAssertEqual(ab, ba)
        print("*************", ab, "***************")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
