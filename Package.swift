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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXAudioBL.git", exact: "1.0.0-beta.20230613192339"),
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.0.0-beta.20230613192339")
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXAudioUI-1.0.0-beta.20230613192339.xcframework.zip",
			checksum: "2779fc9b8eb244175539b963317acd87b87616642a68af10a9bcc8414aa34d8a"
		)
	]
)