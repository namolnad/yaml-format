// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "yaml-format",
    products: [
        .executable(name: "yaml-format", targets: ["YamlFormat"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.4.1"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "4.0.5")
    ],
    targets: [
        .target(
            name: "YamlFormat",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Yams", package: "Yams")
            ]
        ),
        .testTarget(
            name: "YamlFormatTests",
            dependencies: ["YamlFormat"]
        ),
    ]
)
