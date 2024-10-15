// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SampleViewer",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SampleLibrary",
            targets: ["SampleLibrary"]),
        .library(
            name: "HIGConstants",
            targets: ["HIGConstants"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SampleLibrary"),
        .testTarget(
            name: "SampleLibraryTests",
            dependencies: ["SampleLibrary"]
        ),
        .target(
            name: "HIGConstants"),
    ]
)
