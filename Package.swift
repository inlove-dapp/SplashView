// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SplashScreen",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "SplashScreen",
            targets: ["SplashScreen"]),

    ],
    dependencies: [
        .package(url: "https://github.com/onevcat/Kingfisher", from: "7.10.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "SplashScreen", dependencies: [
                .product(name: "Kingfisher", package: "Kingfisher"),
            ]),
        .testTarget(
            name: "SplashScreenTests",
            dependencies: ["SplashScreen"]),
    ])
