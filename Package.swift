// swift-tools-version:5.0

import PackageDescription

let package = Package(
  name: "HtmlKituraSupport",
  products: [
    .library(
      name: "HtmlKituraSupport",
      targets: ["HtmlKituraSupport"]),
    .executable(
      name: "HtmlKituraSupportExample",
      targets: ["HtmlKituraSupportExample"]),
    ],
  dependencies: [
    .package(url: "https://github.com/pointfreeco/swift-html.git", from: "0.3.0"),
    .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.5.0")),
    ],
  targets: [
    .target(
      name: "HtmlKituraSupport",
      dependencies: ["Html", "Kitura"]),
    .testTarget(
      name: "HtmlKituraSupportTests",
      dependencies: ["HtmlKituraSupport"]),
    .target(
      name: "HtmlKituraSupportExample",
      dependencies: ["HtmlKituraSupport"]),
    ]
)
