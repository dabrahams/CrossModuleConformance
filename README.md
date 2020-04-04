# Swift Cross-Module Conformance Demo

This little example demonstrates how Swift deals with conflicting conformances
across modules.  There appears to be some dependence on import order, among
other things.  

In the current state there are two copies of exactly the same test, when run
from Xcode or the command line with `swift test` the first one fails and the
second one succeeds.

```
Test Suite 'All tests' started at 2020-04-04 16:22:27.775
Test Suite 'TopPackageTests.xctest' started at 2020-04-04 16:22:27.775
Test Suite '_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0' started at 2020-04-04 16:22:27.775
Test Case '-[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample]' started.
/private/tmp/CrossModuleConformance/Tests/Test0/Test.swift:7: error: -[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample] : XCTAssertEqual failed: ("B") is not equal to ("A")
/private/tmp/CrossModuleConformance/Tests/Test0/Test.swift:9: error: -[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample] : XCTAssertEqual failed: ("B") is not equal to ("A")
************* B ***************
Test Case '-[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample]' failed (0.058 seconds).
Test Suite '_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0' failed at 2020-04-04 16:22:27.833.
	 Executed 1 test, with 2 failures (0 unexpected) in 0.058 (0.058) seconds
Test Suite '_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1' started at 2020-04-04 16:22:27.833
Test Case '-[_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1 testExample]' started.
************* B ***************
Test Case '-[_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1 testExample]' passed (0.000 seconds).
Test Suite '_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1' passed at 2020-04-04 16:22:27.833.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.000 (0.000) seconds
Test Suite 'TopPackageTests.xctest' failed at 2020-04-04 16:22:27.833.
	 Executed 2 tests, with 2 failures (0 unexpected) in 0.058 (0.058) seconds
Test Suite 'All tests' failed at 2020-04-04 16:22:27.833.
	 Executed 2 tests, with 2 failures (0 unexpected) in 0.058 (0.058) seconds
```
