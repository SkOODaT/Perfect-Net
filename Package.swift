// swift-tools-version:5.1
//
//  Package.swift
//  PerfectNet
//
//  Created by Kyle Jessup on 2016-05-02.
//	Copyright (C) 2016 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PackageDescription

let package : Package

#if os(Linux)
package = Package(
    name: "PerfectNet",
    products: [
        .library(name: "PerfectNet", targets: ["PerfectNet"])
    ],
    dependencies: [
        .package(url: "https://github.com/SkOODaT/Perfect-Crypto.git", .branch("SKOODAT")),
        .package(url: "https://github.com/SkOODaT/Perfect-LinuxBridge.git", .branch("SKOODAT")),
        .package(url: "https://github.com/SkOODaT/Perfect-Thread.git", .branch("SKOODAT")),
    ],
    targets: [
        .target(name: "PerfectNet", dependencies: ["PerfectCrypto", "LinuxBridge", "PerfectThread"]),
        .testTarget(name: "PerfectNetTests", dependencies: ["PerfectNet", "PerfectCrypto", "PerfectThread"])
    ]
)
#else
package = Package(
    name: "PerfectNet",
	platforms: [
		.macOS(.v10_15)
	],
    products: [
        .library(name: "PerfectNet", targets: ["PerfectNet"])
    ],
    dependencies: [
        .package(url: "https://github.com/SkOODaT/Perfect-Crypto.git", .branch("SKOODAT")),
        .package(url: "https://github.com/SkOODaT/Perfect-Thread.git", .branch("SKOODAT"))
    ],
    targets: [
        .target(name: "PerfectNet", dependencies: ["PerfectCrypto", "PerfectThread"]),
        .testTarget(name: "PerfectNetTests", dependencies: ["PerfectNet", "PerfectCrypto", "PerfectThread"])
    ]
)
#endif
