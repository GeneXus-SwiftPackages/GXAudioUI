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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAudioBL.git", exact: "1.0.0-beta.20230701000831"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230701000831")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXAudioUI-1.0.0-beta.20230701000831.xcframework.zip",
			checksum: "a5d3ec3d29aa2bec1a3958ecad3724d84cebfeb4af67668b0012321924567cc6"
		)
	]
)