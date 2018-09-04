// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

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
    .package(url: "https://github.com/pointfreeco/swift-html.git", from: "0.1.1"),
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
