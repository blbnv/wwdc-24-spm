// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FirebaseWrapper",
    products: [
        .library(
            name: "FirebaseWrapper",
            targets: ["FirebaseWrapper"]),
    ],
    targets: [
        .target(
            name: "FirebaseWrapper",
            dependencies: [
                // Analytics
                .target(name: "FBLPromises"),
                .target(name: "FirebaseAnalytics"),
                .target(name: "FirebaseCore"),
                .target(name: "FirebaseCoreInternal"),
                .target(name: "FirebaseInstallations"),
                .target(name: "GoogleAppMeasurement"),
                .target(name: "GoogleAppMeasurementIdentitySupport"),
                .target(name: "GoogleUtilities"),
                .target(name: "nanopb"),
                // Crashlytics
                .target(name: "FirebaseCoreExtension"),
                .target(name: "FirebaseCrashlytics"),
                .target(name: "FirebaseRemoteConfigInterop"),
                .target(name: "FirebaseSessions"),
                .target(name: "GoogleDataTransport"),
                .target(name: "Promises"),
                // Dynamic links
                .target(name: "FirebaseDynamicLinks"),
                // Firebase messaging
                .target(name: "FirebaseMessaging"),
                //                .target(name: "GoogleDataTransport"),
                // Google Signin
                    .target(name: "AppAuth"),
                .target(name: "GoogleSignIn"),
                .target(name: "GTMAppAuth"),
                .target(name: "GTMSessionFetcher"),
            ]
        ),
        // Analytics
        .binaryTarget(name: "FBLPromises", path: "artifacts/FirebaseAnalytics/FBLPromises.xcframework"),
        .binaryTarget(name: "FirebaseAnalytics", path: "artifacts/FirebaseAnalytics/FirebaseAnalytics.xcframework"),
        .binaryTarget(name: "FirebaseCore", path: "artifacts/FirebaseAnalytics/FirebaseCore.xcframework"),
        .binaryTarget(name: "FirebaseCoreInternal", path: "artifacts/FirebaseAnalytics/FirebaseCoreInternal.xcframework"),
        .binaryTarget(name: "FirebaseInstallations", path: "artifacts/FirebaseAnalytics/FirebaseInstallations.xcframework"),
        .binaryTarget(name: "GoogleAppMeasurement", path: "artifacts/FirebaseAnalytics/GoogleAppMeasurement.xcframework"),
        .binaryTarget(name: "GoogleAppMeasurementIdentitySupport", path: "artifacts/FirebaseAnalytics/GoogleAppMeasurementIdentitySupport.xcframework"),
        .binaryTarget(name: "GoogleUtilities", path: "artifacts/FirebaseAnalytics/GoogleUtilities.xcframework"),
        .binaryTarget(name: "nanopb", path: "artifacts/FirebaseAnalytics/nanopb.xcframework"),
        //Firebase Crashlytics
        .binaryTarget(name: "FirebaseCoreExtension", path: "artifacts/FirebaseCrashlytics/FirebaseCoreExtension.xcframework"),
        .binaryTarget(name: "FirebaseCrashlytics", path: "artifacts/FirebaseCrashlytics/FirebaseCrashlytics.xcframework"),
        .binaryTarget(name: "FirebaseRemoteConfigInterop", path: "artifacts/FirebaseCrashlytics/FirebaseRemoteConfigInterop.xcframework"),
        .binaryTarget(name: "FirebaseSessions", path: "artifacts/FirebaseCrashlytics/FirebaseSessions.xcframework"),
        .binaryTarget(name: "GoogleDataTransport", path: "artifacts/FirebaseCrashlytics/GoogleDataTransport.xcframework"),
        .binaryTarget(name: "Promises", path: "artifacts/FirebaseCrashlytics/Promises.xcframework"),
        // Dynamic links
        .binaryTarget(name: "FirebaseDynamicLinks", path: "artifacts/FirebaseDynamicLinks/FirebaseDynamicLinks.xcframework"),
        // Firebase messaging
        .binaryTarget(name: "FirebaseMessaging", path: "artifacts/FirebaseMessaging/FirebaseMessaging.xcframework"),
        
        // Google Signin
        .binaryTarget(name: "AppAuth", path: "artifacts/GoogleSignIn/AppAuth.xcframework"),
        .binaryTarget(name: "GoogleSignIn", path: "artifacts/GoogleSignIn/GoogleSignIn.xcframework"),
        .binaryTarget(name: "GTMAppAuth", path: "artifacts/GoogleSignIn/GTMAppAuth.xcframework"),
        .binaryTarget(name: "GTMSessionFetcher", path: "artifacts/GoogleSignIn/GTMSessionFetcher.xcframework"),
    ]
)
