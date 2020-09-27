// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FoundationExtensionKit",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FoundationExtensionKit",
            targets: ["FoundationExtensionKit"]),

        .library(
            name: "StringExtensionKit",
            targets: ["StringExtensionKit"]),

        .library(
            name: "JSONDecoderKit",
            targets: ["StringExtensionKit"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FoundationExtensionKit",
            dependencies: [
                "StringExtensionKit",
                "JSONDecoderKit"
            ]),

        .target(
            name: "StringExtensionKit",
            dependencies: []),

        .target(
            name: "JSONDecoderKit",
            dependencies: []),

        .testTarget(
            name: "StringExtensionKitTests",
            dependencies: ["StringExtensionKit"]),

        .testTarget(
            name: "JSONDecoderKitTests",
            dependencies: ["JSONDecoderKit"]),
    ]
)
