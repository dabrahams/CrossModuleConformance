# Swift Cross-Module Conformance Demo

This little example demonstrates how Swift deals with conflicting conformances
across modules.  There appears to be some dependence on import order, among
other things.  

Test0 and Test1 are copies of exactly the same test. When run
from Xcode or the command line with `swift test` the first one fails and the
second one succeeds.

Test2 shows that importing `A` first in `AB.swift` changes the result (it prints
`************* A ***************` instead of `************* B ***************`

```
Test Suite 'All tests' started at 2020-04-04 16:34:25.623
Test Suite 'TopPackageTests.xctest' started at 2020-04-04 16:34:25.623
Test Suite '_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0' started at 2020-04-04 16:34:25.623
Test Case '-[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample]' started.
/private/tmp/CrossModuleConformance/Tests/Test0/Test.swift:7: error: -[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample] : XCTAssertEqual failed: ("B") is not equal to ("A")
/private/tmp/CrossModuleConformance/Tests/Test0/Test.swift:9: error: -[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample] : XCTAssertEqual failed: ("B") is not equal to ("A")
************* B ***************
Test Case '-[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample]' failed (0.059 seconds).
Test Suite '_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0' failed at 2020-04-04 16:34:25.682.
	 Executed 1 test, with 2 failures (0 unexpected) in 0.059 (0.059) seconds
Test Suite '_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1' started at 2020-04-04 16:34:25.682
Test Case '-[_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1 testExample]' started.
************* B ***************
Test Case '-[_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1 testExample]' passed (0.000 seconds).
Test Suite '_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1' passed at 2020-04-04 16:34:25.683.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.000 (0.000) seconds
Test Suite '_TtC5Test2P33_3C657EDEBBA25D95DC832C856F538FA05Test2' started at 2020-04-04 16:34:25.705
Test Case '-[_TtC5Test2P33_3C657EDEBBA25D95DC832C856F538FA05Test2 testExample]' started.
************* A ***************
Test Case '-[_TtC5Test2P33_3C657EDEBBA25D95DC832C856F538FA05Test2 testExample]' passed (0.000 seconds).
Test Suite '_TtC5Test2P33_3C657EDEBBA25D95DC832C856F538FA05Test2' passed at 2020-04-04 16:34:25.705.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.000 (0.000) seconds
Test Suite 'TopPackageTests.xctest' failed at 2020-04-04 16:34:25.705.
	 Executed 3 tests, with 2 failures (0 unexpected) in 0.059 (0.082) seconds
Test Suite 'All tests' failed at 2020-04-04 16:34:25.705.
	 Executed 3 tests, with 2 failures (0 unexpected) in 0.059 (0.082) seconds
```
