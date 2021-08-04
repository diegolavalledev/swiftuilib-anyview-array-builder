// swift-tools-version:5.5
import PackageDescription

let package = Package(
  name: "SwiftUILib-AnyViewArrayBuilder",
  platforms: [ .iOS(.v13), .macOS(.v10_15), .watchOS(.v6), .tvOS(.v13) ],
  products: [
    .library(
      name: "SwiftUILib.AnyViewArrayBuilder",
      targets: ["SwiftUILib_AnyViewArrayBuilder"]),
  ],
  targets: [
    .target(
      name: "SwiftUILib_AnyViewArrayBuilder",
      path: "src"),
    .testTarget(
      name: "AnyViewArrayBuilder-Tests",
      dependencies: ["SwiftUILib_AnyViewArrayBuilder"],
      path: "test")
  ]
)
