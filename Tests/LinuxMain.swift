import XCTest

import YamlFormatTests

var tests = [XCTestCaseEntry]()
tests += YamlFormatTests.allTests()
XCTMain(tests)
