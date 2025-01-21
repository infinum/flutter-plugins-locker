// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "flutter_locker",
    platforms: [
        .iOS("12.0")
    ],
    products: [
        .library(name: "flutter-locker", targets: ["flutter_locker"])
    ],
    dependencies: [
        .package(url: "https://github.com/infinum/Locker.git", from: "3.0.4")
    ],
    targets: [
        .target(
            name: "flutter_locker",
            dependencies: ["Locker"],
            resources: []
        )
    ]
)
