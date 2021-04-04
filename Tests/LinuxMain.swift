import XCTest

import yaml_formatTests

var tests = [XCTestCaseEntry]()
tests += yaml_formatTests.allTests()
XCTMain(tests)
