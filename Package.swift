// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Top",
    products: [
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "A", dependencies: ["C"]),
        .target(name: "B", dependencies: ["C"]),
        .target(name: "C", dependencies: []),
        .testTarget(name: "TopTests", dependencies: ["A", "B", "C"]),
    ]
)
