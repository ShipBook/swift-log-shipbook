# LoggingShipbook

![Swift](https://img.shields.io/badge/Swift-5.8-orange.svg)
![Release](https://img.shields.io/github/v/tag/ShipBook/swift-log-shipbook?label=release&logo=github)
![Platforms](https://img.shields.io/badge/platforms-iOS%20%7C%20tvOS-lightgrey.svg)
![License](https://img.shields.io/github/license/ShipBook/swift-log-shipbook)


## About Shipbook
[ShipBook](https://www.shipbook.io) gives you the power to remotely gather, search and analyze your user logs and exceptions in the cloud, on a per-user & session basis.

---

## SwiftLog Introduction

[SwiftLog](https://github.com/apple/swift-log) is a lightweight logging API for Swift that was created by the [Swift Server Working Group](https://www.swift.org/sswg/). It is under apple's umbrella and is a part of the swift server ecosystem, and works on all platforms that Swift supports. It is slowly becoming the standard for logging in Swift. 

## Integrating with SwiftLog

### Installation
To integrate Shipbook with SwiftLog, you need to add the LoggingShipbook package to your project. There are two ways to do this:

#### `Package.swift` file dependency
Add the LoggingShipbook package as a dependency to your `Package.swift` file.

```swift
dependencies: [
    package(url: "https://github.com/ShipBook/swift-log-shipbook.git", from: "1.0.0")
]
```

#### Xcode integration
Or under Xcode, go to `File` -> `Swift Packages` -> `Add Package Dependency` and enter the URL for the LoggingShipbook package https://github.com/ShipBook/swift-log-shipbook.git.

### Usage
Then, you can use the `LoggingShipbook` package to send logs to Shipbook.

```swift
import Logging
import LoggingShipbook

let logger = Logger(label: "com.example.MyApp")

ShipBook.start(appId:"YOUR_APP_ID", appKey:"YOUR_APP_KEY")
LoggingSystem.bootstrap(ShipbookLogHandler.init)
```

Now you can use SwiftLog as you normally would and all logs will be sent to Shipbook.

```swift
logger.info("Hello, world!")
```

## Log Levels

The log levels in SwiftLog are different from those in Shipbook. To map the log levels, you can use the following mapping table:

| SwiftLog Level | Shipbook Level |
|----------------|----------------|
| trace          | verbose        |
| debug          | debug          |
| info           | info           |
| notice         | warning        |
| warning        | warning        |
| error          | error          |
| critical       | error          |

## Shipbook iOS Log integration
For more information about the usage of shipbook and its features, please visit [Shipbook iOS Log integration](https://docs.shipbook.io/ios-log-integration).
