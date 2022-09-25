// swift-tools-version:5.6

import PackageDescription

let package = Package(
  name: "website-2.0",
  platforms: [
    .macOS(.v11),
  ],
  products: [
    .executable(
      name: "website-2.0",
      targets: ["website-2.0"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/swiftwasm/JavaScriptKit", from: "0.15.0"),
    .package(
      url: "https://github.com/mustiikhalil/FlatBuffers",
      from: "2.0.8"),
    .package(
      url: "https://github.com/TokamakUI/Tokamak",
      branch: "main")
  ],
  targets: [
    .executableTarget(
      name: "website-2.0",
      dependencies: [
        .product(
          name: "TokamakShim",
          package: "Tokamak"),
        .product(
          name: "FlatBuffers",
          package: "FlatBuffers"),
        .product(
          name: "JavaScriptKit",
          package: "JavaScriptKit")
      ]),
    .testTarget(
      name: "website-2.0Tests",
      dependencies: ["website-2.0"]),
  ]
)
