// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Menu",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Menu",
            targets: ["Menu"]),
    ],
    dependencies: [
        .package(path: "../PWFCommon")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Menu",
            dependencies: [.product(name: "PWFCommon", package: "PWFCommon", condition: nil)]),
        .testTarget(
            name: "MenuTests",
            dependencies: ["Menu"]),
    ]
)
