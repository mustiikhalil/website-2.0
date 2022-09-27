// swift-tools-version:5.6

import PackageDescription

let package = Package(
  name: "website-2.0",
  platforms: [
    .macOS(.v12),
  ],
  products: [
    .executable(
      name: "website-2.0",
      targets: ["website-2.0"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/mustiikhalil/FlatBuffers",
      from: "22.9.24"),
    .package(
      url: "https://github.com/swiftwasm/WebFoundation",
      branch: "main"),
    .package(
      url: "https://github.com/TokamakUI/Tokamak",
      branch: "main")
  ],
  targets: [
    .executableTarget(
      name: "website-2.0",
      dependencies: [
        .product(
          name: "WebFoundation",
          package: "WebFoundation"),
        .product(
          name: "TokamakShim",
          package: "Tokamak"),
        .product(
          name: "FlatBuffers",
          package: "FlatBuffers"),
      ]),
    .testTarget(
      name: "website-2.0Tests",
      dependencies: ["website-2.0"]),
  ]
)
