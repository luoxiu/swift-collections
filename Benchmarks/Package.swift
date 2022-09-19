// swift-tools-version:5.3
//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift Collections open source project
//
// Copyright (c) 2021 Apple Inc. and the Swift project authors
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

import PackageDescription

let package = Package(
  name: "swift-collections.Benchmarks",
  products: [
    .executable(name: "benchmark", targets: ["benchmark"]),
  ],
  dependencies: [
    .package(name: "swift-collections", path: ".."),
    .package(url: "https://github.com/apple/swift-collections-benchmark", from: "0.0.3"),
  ],
  targets: [
    .target(
      name: "Benchmarks",
      dependencies: [
        .product(name: "Collections", package: "swift-collections"),
        .product(name: "CollectionsBenchmark", package: "swift-collections-benchmark"),
        "CppBenchmarks",
      ],
      resources: [
        .copy("Library.json"),
      ]
    ),
    .target(
      name: "CppBenchmarks"
    ),
    .target(
      name: "benchmark",
      dependencies: [
        "Benchmarks",
      ],
      path: "Sources/benchmark-tool"
    ),
  ],
  cxxLanguageStandard: .cxx1z
)
