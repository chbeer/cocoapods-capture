// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SKTCapture",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "SKTCapture",
            targets: ["SKTCapture", "CaptureHelper"]),
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "SKTCapture",
            path: "lib/SKTCapture.xcframework"),
        
        .target(
            name: "CaptureHelper",
            dependencies: ["SKTCapture"],
            path: ".",
            exclude: [
                "socketmobilepublickey.pem",
                "SKTCapture.podspec",
                "Tests/cocoapods-captureTests/cocoapods_captureTests.swift",
                "softScanBeep.wav",
                "README.md",
                "CHANGELOG.md",
                "buildscripts/updateVersion.py",
                "lib/SKTCapture.xcframework",
                "LICENSE",
            ],
            sources: ["CaptureHelper.swift"],
            linkerSettings: [
                .linkedLibrary("stdc++"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("AudioToolbox")
            ]),
            
        .testTarget(
            name: "cocoapods-captureTests",
            dependencies: ["CaptureHelper"]
        )
    ]
)
