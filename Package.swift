// swift-tools-version: 6.0
import PackageDescription

let package = Package(
    name: "SevenHundredBlind",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "SevenHundredBlind", targets: ["SevenHundredBlind"])
    ],
    targets: [
        .target(name: "SevenHundredBlind"),
        .testTarget(name: "SevenHundredBlindTests", dependencies: ["SevenHundredBlind"])
    ]
)
