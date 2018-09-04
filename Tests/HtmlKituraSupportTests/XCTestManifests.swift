import XCTest

extension HtmlKituraSupportTests {
    static let __allTests = [
        ("testSomething", testSomething),
    ]
}

#if !os(macOS)
public func __allTests() -> [XCTestCaseEntry] {
    return [
        testCase(HtmlKituraSupportTests.__allTests),
    ]
}
#endif
