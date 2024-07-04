// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModuleX",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "ModuleX",
            type: .static,
            targets: [
                "ModuleX"
            ]
        )
    ],
    dependencies: [
        
    ],
    targets: [
//        .binaryTarget(name: "ApolloAPI", path: "../SDKs/ApolloAPI.xcframework"),
        .target(name: "ModuleX", dependencies: [])
    ]
)
