// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXAudioUI",
	platforms: [.iOS("12.0"), .visionOS("1.0")],
	products: [
		.library(
			name: "GXAudioUI",
			targets: ["GXAudioUIWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAudioBL.git", exact: "2.1.0"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.1.0")
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
			url: "https://pkgs.genexus.dev/iOS/releases/GXAudioUI-2.1.0.xcframework.zip",
			checksum: "8fa1ce484bdca8de10e961b6ba8338ef8578fdf5fde13fff63870661ac561be4"
		)
	]
)