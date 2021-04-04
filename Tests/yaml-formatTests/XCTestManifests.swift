import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(yaml_formatTests.allTests),
    ]
}
#endif
