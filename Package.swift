// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "MostfaBlog",
    products: [
        .executable(
            name: "MostfaBlog",
            targets: ["MostfaBlog"]
        )
    ],
    dependencies: [
//        .package(name: "Publish", url: "/Users/mostfaessam/Documents/mostfaBlog/Sources/Publish-master/", from: "0.6.0"),
        .package(name: "Publish", path: "/Users/mostfaessam/Documents/mostfaBlog/Sources/Publish-master/"),
       .package(name: "SplashPublishPlugin", path: "/Users/mostfaessam/Downloads/SplashPublishPlugin-master/")

    ],
    targets: [
        .target(
            name: "MostfaBlog",
            dependencies: ["Publish","SplashPublishPlugin"]
        )
    ]
)



