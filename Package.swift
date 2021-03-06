// swift-tools-version:5.3.0

import PackageDescription

let package = Package(
    name: "Alert",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(
            name: "AlertBuilder", 
            targets: [
                "AlertBuilder"
            ]
        ),
        .library(
            name: "Alert",
            targets: [
                "Alert"
            ]
        )
    ],
    dependencies: [
        .package(name: "Core", url: "https://github.com/kutchie-pelaez-packages/Core.git", .branch("master")),
        .package(name: "CoreUI", url: "https://github.com/kutchie-pelaez-packages/CoreUI.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "AlertBuilder",
            dependencies: [
                .product(name: "Core", package: "Core"),
                .product(name: "CoreUI", package: "CoreUI"),
                .target(name: "Alert")
            ]
        ),
        .target(
            name: "Alert",
            dependencies: [
                .product(name: "Core", package: "Core")
            ]
        )
    ]
)
