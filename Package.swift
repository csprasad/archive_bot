// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "archive_bot",
    platforms: [.macOS(.v13)],
    dependencies: [
        // Add any dependencies here
    ],
    targets: [
        .executableTarget(
            name: "archive_bot",
            dependencies: []
        )
    ]
)
