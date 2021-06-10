// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SpriteKitEasingSwift",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "SpriteKitEasingSwift",
            targets: ["SpriteKitEasingSwift"])
    ],
    targets: [
        .target(
            name: "SpriteKitEasingSwift",
            path: "SpriteKitEasingSwift/Classes")
    ]
)
