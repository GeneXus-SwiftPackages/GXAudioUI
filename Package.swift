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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAudioBL.git", exact: "1.1.0-rc.3"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.1.0-rc.3")
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXAudioUI-1.1.0-rc.3.xcframework.zip",
			checksum: "8f826b12c262065ee8877323510bc022137af3579ba75e9322e8075898927ea0"
		)
	]
)