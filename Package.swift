// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-log-shipbook",
    platforms: [
       .iOS(.v14),   // Minimum deployment target for iOS
       .tvOS(.v14)   // Minimum deployment target for tvOS
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "LoggingShipbook",
            targets: ["LoggingShipbook"]),
    ],
    dependencies: [
      .package(url: "https://github.com/apple/swift-log.git", from: "1.5.0"),
      .package(url: "https://github.com/ShipBook/ShipBookSDK-iOS.git", from: "1.2.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "LoggingShipbook",
            dependencies: [
              .product(name: "Logging", package: "swift-log"),
              .product(name: "ShipBookSDK", package: "ShipBookSDK-iOS")
            ]
        ),
        .testTarget(
            name: "LoggingShipbookTests",
            dependencies: ["LoggingShipbook"]),
    ]
)
