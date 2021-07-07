// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "HanoyTowers",
    products: [
        .library(name: "HanoyTowers", targets: ["Induction"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-algorithms", from: "0.0.1"),],
    targets: [
        .target(
            name: "Induction",
            dependencies: [.product(name: "Algorithms", package: "swift-algorithms")]),
        .target(
            name: "InductionApp",
            dependencies: ["Induction"]),
    ]
)
