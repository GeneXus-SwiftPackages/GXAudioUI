// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXAudioUI",
	platforms: [.iOS("12.0")],
	products: [
		.library(
			name: "GXAudioUI",
			targets: ["GXAudioUIWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAudioBL.git", exact: "1.5.0-beta.16"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.5.0-beta.16")
	],
	targets: [
		.target(name: "GXAudioUIWrapper",
				dependencies: [
					"GXAudioUI",
					.product(name: "GXAudioBL", package: "GXAudioBL", condition: .when(platforms: [.iOS])),
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXAudioUI",
			url: "https://pkgs.genexus.dev/iOS/beta/GXAudioUI-1.5.0-beta.16.xcframework.zip",
			checksum: "da8cc79134a2c6584924756294615810d0622c9e9ffc14b73b597bc957f9e2b2"
		)
	]
)