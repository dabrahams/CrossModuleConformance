import XCTest

import Test0
import Test1

var tests = [XCTestCaseEntry]()
tests += Test0.allTests()
tests += Test1.allTests()
tests += Test2.allTests()
tests += Test3.allTests()
XCTMain(tests)
