import XCTest
@testable import LoggingShipbook
import Logging

import ShipBookSDK

final class LoggingShipbookTests: XCTestCase {
  override class func setUp() {
    super.setUp()
    // Set up any state that is shared across all tests
    // Example: Set up database or network connections
    ShipBook.enableInnerLog(enable: true)
    ShipBook.start(appId: "", appKey: "")
    LoggingSystem.bootstrap(ShipbookLogHandler.init)
    print("Setting up shared resources")
  }
  
  func testExample() throws {

    var logger = Logger(label: "Shipbook")
    logger[metadataKey: "request-uuid"] = "\(UUID())"
    logger.info("this is a test via shipbook")
  }
}
