// swift-tools-version: 5.9
    // The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWDC24Modules",
    defaultLocalization: "en",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "WWDC24Modules",
            type: .static,
            targets: [
                "Module1",
                "Module60"
            ]
        )
    ],
    dependencies: [
        .package(path: "/LegacyApollo"),
        .package(url: "https://github.com/apollographql/apollo-ios", exact: "1.14.1"),
    ],
    targets: [
        /// Local Binaries
        .binaryTarget(name: "Lottie",
                      url: "https://github.com/airbnb/lottie-ios/releases/download/4.4.3/Lottie-Xcode-15.2.xcframework.zip",
                      checksum: "546b7e718ed806646b84645ecfb1e1d6a65ac0387ff3f8ecb92dbaf2116cd62c"),
        .binaryTarget(name: "AppsFlyer",
                      url: "https://github.com/AppsFlyerSDK/AppsFlyerFramework/releases/download/6.14.3/AppsFlyerLib-Dynamic-SPM.xcframework.zip",
                      checksum: "a870fe03026aa2df6d81b9ae09d19ddb8666d51748fa617ee0582b299b62b689"),
        .binaryTarget(name: "Instabug",
                      url: "https://github.com/Instabug/Instabug-SP/releases/download/13.1.0/Instabug-XCFramework.zip",
                      checksum: "741e7509968ae7f2f9b7de93299c045a5fd4f0801b018a0fa65b8291bd1751d2"),
        /// Modules
        .target(
            name: "Module60",
            dependencies: [
                .product(name: "LegacyApollo", package: "LegacyApollo"),
                .product(name: "Apollo", package: "apollo-ios"),
            ],
            swiftSettings: .common
        ),
        .target(
            name: "Module59",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module58",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module57",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module56",
            dependencies: [
            ],
            swiftSettings: .common
        ),
        .target(
            name: "Module55",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module54",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module53",
            dependencies: [
                
            ],
            swiftSettings: .common
        ),
        .target(
            name: "Module52",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module51",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module50",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module49",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module48",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module47",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module46",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module45",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module44",
            dependencies: [
                "Instabug"
            ],
            swiftSettings: .common
        ),
        .target(
            name: "Module43",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module42",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module41",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module40",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module39",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module38",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module37",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module36",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module35",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module34",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module33",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module32",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module31",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module30",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module29",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module28",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module27",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module26",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module25",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module24",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module23",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module22",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module21",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module20",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module19",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module18",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module17",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module16",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module15",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module14",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module13",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module12",
            dependencies: [
            ],
            swiftSettings: .common
        ),
        .target(
            name: "Module11",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module10",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module9",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module8",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module7",
            dependencies: [
            ],
            swiftSettings: .common
        ),
        .target(
            name: "Module6",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module5",
            dependencies: [],
            swiftSettings: .common
        ),
        .target(
            name: "Module1",
            dependencies: [
                "Lottie",
                // local
                "Module2",
                "Module3",
                "Module4",
                "Module5",
                "Module6",
                "Module7",
                "Module8",
                "Module9",
                "Module10",
                "Module11",
                "Module12",
                "Module13",
                "Module14",
                "Module15",
                "Module16",
            ],
            swiftSettings: .common
        ),
        .target(
            name: "Module2",
            dependencies: [
                
            ],
            swiftSettings: .common
        ),
        .target(
            name: "Module3",
            dependencies: [
                
            ],
            swiftSettings: .common
        ),
        .target(
            name: "Module4",
            dependencies: [
            ],
            swiftSettings: .common
        ),
    ]
)

extension [SwiftSetting] {
    static let common: Self = [
        // .define("INTERNAL", .when(configuration: .debug)), // NOTE: We used to use this for INTERNAL build flag, which we don't use anymore, but I'm leaving this in as example in case we ever need a flag defined for all modules, for only certain build configurations
        .enableUpcomingFeature("BareSlashRegexLiterals"),
        .enableUpcomingFeature("ForwardTrailingClosures"),
        .enableUpcomingFeature("ImportObjcForwardDeclarations"),
    ]
}
