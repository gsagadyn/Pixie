// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Pixie",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "Pixie", targets: ["Pixie"])
    ],
    targets: [
        .target(name: "Pixie", dependencies: [], path: "Pixie/Pixie/Classes")
    ]
)
