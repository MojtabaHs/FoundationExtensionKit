// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "FoundationExtensionKit",
    products: [
        .library(
            name: "FoundationExtensionKit",
            targets: ["FoundationExtensionKit"]
        ),
        .library(
            name: "JSONDecoderKit",
            targets: ["JSONDecoderKit"]
        ),
        .library(
            name: "StringExtensionKit",
            targets: ["StringExtensionKit"]
        ),
        .library(
            name: "URLExtensionKit",
            targets: ["URLExtensionKit"]
        ),
        .library(
            name: "DataExtensionKit",
            targets: ["DataExtensionKit"]
        ),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "FoundationExtensionKit",
            dependencies: [
                "StringExtensionKit",
                "JSONDecoderKit",
                "URLExtensionKit",
                "TimeIntervalExtensionKit",
                "DataExtensionKit",
            ]
        ),
        .target(
            name: "JSONDecoderKit",
            dependencies: []
        ),
        .target(
            name: "StringExtensionKit",
            dependencies: []
        ),
        .target(
            name: "URLExtensionKit",
            dependencies: []
        ),
        .target(
            name: "TimeIntervalExtensionKit",
            dependencies: []
        ),
        .target(
            name: "DataExtensionKit",
            dependencies: []
        ),
        
        // MARK: - Test Targets
        .testTarget(
            name: "StringExtensionKitTests",
            dependencies: ["StringExtensionKit"]
        ),
        .testTarget(
            name: "JSONDecoderKitTests",
            dependencies: ["JSONDecoderKit"]
        ),
        .testTarget(
            name: "TimeIntervalExtensionKitTests",
            dependencies: ["TimeIntervalExtensionKit"]
        ),
        .testTarget(
            name: "DataExtensionKitTests",
            dependencies: ["DataExtensionKit"]
        ),
    ]
)
