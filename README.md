# Swift Cross-Module Conformance Demo

Bug Report: https://bugs.swift.org/browse/SR-12513

This little example demonstrates how Swift deals with conflicting conformances
across modules.  There appears to be some dependence on import order, among
other things.  

Test0 and Test1 are copies of exactly the same test. When run
from Xcode or the command line with `swift test` the first one fails and the
second one succeeds.

Test2 shows that importing `A` first in `AB.swift` changes the result (it prints
`************* A ***************` instead of `************* B ***************`

Test3 demonstrates some real insanity: the compiler makes me import `C` in
`AB.swift` to get the definition of `X` (comment out the import to see what
happens), but somehow I am able to use `X.idA` without having imported `A` (and
vice-versa in `AB.swift`).  Furthermore, I can change the printed output by
adding `import B` above the import of `C` in either file.

```
Test Suite 'All tests' started at 2020-04-04 16:48:42.563
Test Suite 'TopPackageTests.xctest' started at 2020-04-04 16:48:42.563
Test Suite '_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0' started at 2020-04-04 16:48:42.563
Test Case '-[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample]' started.
/private/tmp/CrossModuleConformance/Tests/Test0/Test.swift:7: error: -[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample] : XCTAssertEqual failed: ("B") is not equal to ("A")
/private/tmp/CrossModuleConformance/Tests/Test0/Test.swift:9: error: -[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample] : XCTAssertEqual failed: ("B") is not equal to ("A")
************* B ***************
Test Case '-[_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0 testExample]' failed (0.058 seconds).
Test Suite '_TtC5Test0P33_CEA558236F67D8DF21D0BC2B31E1904B5Test0' failed at 2020-04-04 16:48:42.622.
	 Executed 1 test, with 2 failures (0 unexpected) in 0.058 (0.058) seconds
Test Suite '_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1' started at 2020-04-04 16:48:42.622
Test Case '-[_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1 testExample]' started.
************* B ***************
Test Case '-[_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1 testExample]' passed (0.000 seconds).
Test Suite '_TtC5Test1P33_65731C05F97E74B8C05F6F38F5C68ED15Test1' passed at 2020-04-04 16:48:42.622.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.000 (0.000) seconds
Test Suite '_TtC5Test2P33_3C657EDEBBA25D95DC832C856F538FA05Test2' started at 2020-04-04 16:48:42.622
Test Case '-[_TtC5Test2P33_3C657EDEBBA25D95DC832C856F538FA05Test2 testExample]' started.
************* A ***************
Test Case '-[_TtC5Test2P33_3C657EDEBBA25D95DC832C856F538FA05Test2 testExample]' passed (0.000 seconds).
Test Suite '_TtC5Test2P33_3C657EDEBBA25D95DC832C856F538FA05Test2' passed at 2020-04-04 16:48:42.622.
	 Executed 1 test, with 0 failures (0 unexpected) in 0.000 (0.000) seconds
Test Suite '_TtC5Test3P33_A690C4A66C3067EDFF1016577AB637D25Test3' started at 2020-04-04 16:48:42.622
Test Case '-[_TtC5Test3P33_A690C4A66C3067EDFF1016577AB637D25Test3 testExample]' started.
/private/tmp/CrossModuleConformance/Tests/Test3/Test.swift:9: error: -[_TtC5Test3P33_A690C4A66C3067EDFF1016577AB637D25Test3 testExample] : XCTAssertEqual failed: ("A") is not equal to ("B")
/private/tmp/CrossModuleConformance/Tests/Test3/Test.swift:11: error: -[_TtC5Test3P33_A690C4A66C3067EDFF1016577AB637D25Test3 testExample] : XCTAssertEqual failed: ("A") is not equal to ("B")
************* A ***************
Test Case '-[_TtC5Test3P33_A690C4A66C3067EDFF1016577AB637D25Test3 testExample]' failed (0.151 seconds).
Test Suite '_TtC5Test3P33_A690C4A66C3067EDFF1016577AB637D25Test3' failed at 2020-04-04 16:48:42.773.
	 Executed 1 test, with 2 failures (0 unexpected) in 0.151 (0.151) seconds
Test Suite 'TopPackageTests.xctest' failed at 2020-04-04 16:48:42.773.
	 Executed 4 tests, with 4 failures (0 unexpected) in 0.210 (0.210) seconds
Test Suite 'All tests' failed at 2020-04-04 16:48:42.774.
	 Executed 4 tests, with 4 failures (0 unexpected) in 0.210 (0.211) seconds
```
