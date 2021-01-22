// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "AWSClientRuntime",
    platforms: [
	.macOS(.v10_15),
	.iOS(.v13)
    ],
    products: [
        .library(name: "AWSClientRuntime", targets: ["AWSClientRuntime"])
    ],
    dependencies: [
        .package(name: "ClientRuntime", path: "~/Projects/Amplify/SwiftSDK/smithy-swift/ClientRuntime"),
        .package(name: "AwsCrt", path: "~/Projects/Amplify/SwiftSDK/aws-crt-swift")
    ],
    targets: [
        .target(
            name: "AWSClientRuntime",
            dependencies: [
                .product(name: "ClientRuntime", package: "ClientRuntime"),
                .product(name: "AwsCommonRuntimeKit", package: "AwsCrt")
            ]
        ),
        .testTarget(
            name: "AWSClientRuntimeTests",
            dependencies: [
                .product(name: "SmithyTestUtil", package: "ClientRuntime")
            ]
        )
    ]
)
