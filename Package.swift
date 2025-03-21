// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "hexhsl",
    products: [
        .executable(name: "hexhsl", targets: ["hexhsl"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
    ],
    targets: [
        .executableTarget(
            name: "hexhsl",
            path: "Sources/hexhsl"
        ),
        .testTarget(
            name: "hexhslTests",
            dependencies: ["hexhsl"],
            path: "Tests/hexhslTests"
        )
    ]
)
