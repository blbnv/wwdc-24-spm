// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LegacyApollo",
  platforms: [
    .iOS(.v12),
  ],
  products: [
    .library(
      name: "LegacyApollo",
      targets: ["LegacyApollo"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "LegacyApollo",
      dependencies: [
        "LegacyApolloAPI",
        "LegacyApolloUtils"
      ],
      exclude: [
        "Info.plist"
      ]),
    .target(
      name: "LegacyApolloAPI",
      dependencies: [],
      exclude: [
        "Info.plist",
        "CodegenV1"
      ]),
    .target(
      name: "LegacyApolloUtils",
      dependencies: [],
      exclude: [
        "Info.plist"
      ]),
  ]
)
