// The Swift Programming Language
// https://docs.swift.org/swift-book


import Logging
import ShipBookSDK
#if canImport(UIKit)

public struct ShipbookLogHandler: LogHandler {
  public var label: String
  public var logLevel: Logger.Level = .trace
//  public var metadata: Logger.Metadata = Logger.Metadata()
  
  private var prettyMetadata: String?
  public var metadata = Logger.Metadata() {
      didSet {
          self.prettyMetadata = self.prettify(self.metadata)
      }
  }
  
  public init(_ label: String) {
    self.label = label
    print("the label is \(label)")
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
    let effectiveMetadata = ShipbookLogHandler.prepareMetadata(base: self.metadata, explicit: metadata)

    let prettyMetadata: String?
    if let effectiveMetadata = effectiveMetadata {
        prettyMetadata = self.prettify(effectiveMetadata)
    } else {
        prettyMetadata = self.prettyMetadata
    }

    let msg = (prettyMetadata ?? "").isEmpty ? "\(message)" : "\(prettyMetadata!) \(message)"

    switch level {
      case .trace:
        ShipBookSDK.Log.v(msg, tag: self.label, function: function, file: file ,  line: Int(line))
      case .debug:
        Log.d(msg, tag: self.label, function: function, file: file ,  line: Int(line))
      case .info:
        Log.i(msg, tag: self.label, function: function, file: file ,  line: Int(line))
      case .notice, .warning:
        Log.w(msg, tag: self.label, function: function, file: file ,  line: Int(line))
      case .error, .critical:
        Log.e(msg, tag: self.label, function: function, file: file ,  line: Int(line))
    }
  }
  
  internal static func prepareMetadata(base: Logger.Metadata, explicit: Logger.Metadata?) -> Logger.Metadata? {
      var metadata = base

      if let explicit = explicit, !explicit.isEmpty {
          metadata.merge(explicit, uniquingKeysWith: { _, explicit in explicit })
      }

      return metadata
  }

  private func prettify(_ metadata: Logger.Metadata) -> String? {
      if metadata.isEmpty {
          return nil
      } else {
          return metadata.lazy.sorted(by: { $0.key < $1.key }).map { "\($0)=\($1)" }.joined(separator: " ")
      }
  }
}
#endif
