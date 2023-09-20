// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "DemoXCFramework",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "DemoXCFramework",
            targets: ["DemoXCFramework"])
    ],
    targets: [
        .binaryTarget(name: "DemoXCFramework", path: "./DemoXCFramework.xcframework")
    ]
)
