// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "MostfaBlog",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "MostfaBlog",
            targets: ["MostfaBlog"]
        )
    ],
    dependencies: [
      .package(name: "Publish", path: "/Users/mostfaessam/Downloads/Publish"),
      .package(name: "SplashPublishPlugin", path: "/Users/mostfaessam/SplashPublishPlugin")
    ],
    targets: [
        .target(
            name: "MostfaBlog",
            dependencies: ["Publish","SplashPublishPlugin"]
        )
    ]
)



