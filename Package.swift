// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXAudioUI",
	platforms: [.iOS("15.0"), .visionOS("2.0")],
	products: [
		.library(
			name: "GXAudioUI",
			targets: ["GXAudioUIWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAudioBL.git", exact: "4.2.0-beta.38"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.2.0-beta.38")
	],
	targets: [
		.target(name: "GXAudioUIWrapper",
				dependencies: [
					"GXAudioUI",
					.product(name: "GXAudioBL", package: "GXAudioBL", condition: .when(platforms: [.iOS, .visionOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .visionOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXAudioUI",
			url: "https://pkgs.genexus.dev/iOS/beta/GXAudioUI-4.2.0-beta.38.xcframework.zip",
			checksum: "8714255164fabcf255e078f2f5996e0777f1e02fef99d92915c2aa354dc91de6"
		)
	]
)