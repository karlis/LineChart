// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "LineChart",
  platforms: [
    .iOS(.v13)
  ],
  products: [
    .library(
      name: "LineChart",
      targets: ["LineChart"]),
  ],
  dependencies: [],
  targets: [
    .target(
      name: "LineChart",
      dependencies: []),
  ]
)
