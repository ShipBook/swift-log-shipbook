// The Swift Programming Language
// https://docs.swift.org/swift-book


import Logging
import ShipBookSDK
#if canImport(UIKit)

public struct ShipbookLogHandler: LogHandler {
  public var logLevel: Logger.Level
  public var metadata: Logger.Metadata
  
  public init(_ label: String, level: Logger.Level = .trace, metadata: Logger.Metadata = [:]) {
    self.logLevel = level
    self.metadata = metadata
  }
  
  public subscript(metadataKey metadataKey: String) -> Logger.Metadata.Value? {
    get {
      return metadata[metadataKey]
    }
    set {
      metadata[metadataKey] = newValue
    }
  }
  
  public func log(level: Logger.Level, message: Logger.Message, metadata: Logger.Metadata?, source: String, file: String, function: String, line: UInt) {
//    print("the metadata is \(String(describing: metadata))")
//    print("original metadata is \(self.metadata)")
//    print("the message is \(message)")
    switch level {
      case .trace:
        ShipBookSDK.Log.v(message.description, tag: source, function: function, file: file ,  line: Int(line))
      case .debug:
        Log.d(message.description, tag: source, function: function, file: file ,  line: Int(line))
      case .info:
        Log.i(message.description, tag: source, function: function, file: file ,  line: Int(line))
      case .notice, .warning:
        Log.w(message.description, tag: source, function: function, file: file ,  line: Int(line))
      case .error, .critical:
        Log.e(message.description, tag: source, function: function, file: file ,  line: Int(line))
    }
  }
}
#endif
