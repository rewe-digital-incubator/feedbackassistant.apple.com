# `platforms` is ignored when using XCFramework

Original issue apple/swift-package-manager/issues/6931.

## Description

Using SPM to distribute a XCFramework, setting `platforms` in the pacakge manifest to a higher version than the integrating app target doesn't result in an error.

## Expected behavior

Building an app target results in a compiler error.

## Actual behavior

App target finishs building.

## Steps to reproduce:

1. Create a new project in Xcode with an iOS Framework and set Deployment Target to iOS SDK 17

2. Add a source file.
```
import Foundation

#if os(iOS)
public func demo() {
    let resource = LocalizedStringResource(stringLiteral: "^[They](referentConcept: 1) said 'Hello 🌍'.")

    var options = AttributedString.LocalizationOptions()
    options.concepts = [.termsOfAddress([.masculine])]

    print(AttributedString(localized: resource, options: options))
}
#endif
```

3. Create a XCFramework from the package.
```
xcodebuild archive -project DemoXCFramework.xcodeproj -scheme DemoXCFramework -destination "generic/platform=iOS Simulator" -archivePath "DemoXCFramework/DemoXCFramework" SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES
xcodebuild -create-xcframework -framework DemoXCFramework/DemoXCFramework.xcarchive/Products/Library/Frameworks/DemoXCFramework.framework -output DemoXCFramework.xcframework 
```

4. Create a new package to distribute the XCFramework with the following manifest:
```
// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "DemoXCFramework",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "DemoXCFramework",
            targets: ["DemoXCFramework"])
    ],
    targets: [
        .binaryTarget(name: "DemoXCFramework", path: "./DemoXCFramework.xcframework")
    ]
)
```

5. Copy the XFramework to the package.

6. Create a new Xcode project with an iOS App and set a lower deployment target than the package in the previous step:

7. Add the package to the target and the XCFramework as a dependency.

8. Import the module and call `DemoXCFramework.demo()`
