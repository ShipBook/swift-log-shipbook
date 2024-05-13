import XCTest
@testable import swift_log_shipbook
import Logging

import ShipBookSDK

final class swift_log_shipbookTests: XCTestCase {
  override class func setUp() {
    super.setUp()
    // Set up any state that is shared across all tests
    // Example: Set up database or network connections
    ShipBook.enableInnerLog(enable: true)
    ShipBook.start(appId: "", appKey: "")
    print("Setting up shared resources")
  }
  
  func testExample() throws {
    // XCTest Documentation
    // https://developer.apple.com/documentation/xctest
    
    // Defining Test Cases and Test Methods
    // https://developer.apple.com/documentation/xctest/defining_test_cases_and_test_methods
    
    var logger = Logger(label: "Shipbook", factory: { (label) in
      ShipbookLogHandler("io.shipbook")
    })
    
    logger[metadataKey: "request-uuid"] = "\(UUID())"
    logger.info("this is a test via shipbook")
  }
}
