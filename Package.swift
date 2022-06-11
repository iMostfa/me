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
      .package(name: "Publish", url: "https://github.com/johnsundell/publish", from: "0.9.0"),
      .package(name: "SplashPublishPlugin", url: "https://github.com/johnsundell/splashpublishplugin", from: "0.2.0")

    ],
    targets: [
        .target(
            name: "MostfaBlog",
            dependencies: ["Publish","SplashPublishPlugin"]
        )
    ]
)



