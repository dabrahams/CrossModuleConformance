// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Top",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "Top",
            targets: ["Top"]),
        .library(
            name: "A",
            targets: ["A"]),
        .library(
            name: "B",
            targets: ["B"]),
    .library(
        name: "Bottom",
        targets: ["Bottom"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "Top",
            dependencies: ["A", "B", "Bottom"]),
        .target(
            name: "A",
            dependencies: ["Bottom"]),
        .target(
            name: "B",
            dependencies: ["Bottom"]),
        .target(
            name: "Bottom",
            dependencies: []),
        .testTarget(
            name: "TopTests",
            dependencies: ["Top", "A", "B", "Bottom"]),
    ]
)
