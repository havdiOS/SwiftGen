//: #### Other pages
//:
//: * [Demo for `colors` parser](Colors-Demo)
//: * [Demo for `coredata` parser](CoreData-Demo)
//: * [Demo for `files` parser](Files-Demo)
//: * [Demo for `fonts` parser](Fonts-Demo)
//: * [Demo for `ib` parser](InterfaceBuilder-Demo)
//: * [Demo for `json` parser](JSON-Demo)
//: * Demo for `plist` parser
//: * [Demo for `strings` parser](Strings-Demo)
//: * [Demo for `xcassets` parser](XCAssets-Demo)
//: * [Demo for `yaml` parser](YAML-Demo)

// setup code
// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    return Bundle(for: BundleToken.self)
  }()
}
// swiftlint:enable convenience_type
bundle = BundleToken.bundle

//: #### Example of code generated by `plist` parser with "inline-swift5" template

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Plist Files

// swiftlint:disable identifier_name line_length number_separator type_body_length
internal enum PlistFilesInline {
  internal enum Info {
    internal static let cfBundleDevelopmentRegion: String = "en"
    internal static let cfBundleInfoDictionaryVersion: String = "6.0"
    internal static let cfBundleShortVersionString: String = "1.2.0"
    internal static let fabric: [String: Any] = ["APIKey": "512345678900aaafffff", "Kits": [["KitInfo": [:], "KitName": "Crashlytics"]]]
    internal static let uiLaunchStoryboardName: String = "LaunchScreen"
    internal static let uiMainStoryboardFile: String = "Start"
  }
  internal enum Configuration {
    internal static let environment: String = "development"
    internal static let names: [String] = ["John", "Peter", "Nick"]
    internal static let options: [String: Any] = ["Animation Style": "Party Mode"]
  }
  internal enum ShoppingList {
    internal static let items: [String] = ["Eggs", "Bread", "Milk"]
  }
}
// swiftlint:enable identifier_name line_length number_separator type_body_length

//: #### Example of code generated by `plist` parser with "runtime-swift5" template

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Plist Files

// swiftlint:disable identifier_name line_length type_body_length
internal enum PlistFilesRuntime {
  internal enum Info {
    private static let _document = PlistDocument(path: "TestInfo.plist")
    internal static let cfBundleDevelopmentRegion: String = _document["CFBundleDevelopmentRegion"]
    internal static let cfBundleInfoDictionaryVersion: String = _document["CFBundleInfoDictionaryVersion"]
    internal static let cfBundleShortVersionString: String = _document["CFBundleShortVersionString"]
    internal static let fabric: [String: Any] = _document["Fabric"]
    internal static let uiLaunchStoryboardName: String = _document["UILaunchStoryboardName"]
    internal static let uiMainStoryboardFile: String = _document["UIMainStoryboardFile"]
  }
  internal enum Configuration {
    private static let _document = PlistDocument(path: "configuration.plist")
    internal static let environment: String = _document["Environment"]
    internal static let names: [String] = _document["Names"]
    internal static let options: [String: Any] = _document["Options"]
  }
  internal enum ShoppingList {
    internal static let items: [String] = arrayFromPlist(at: "shopping-list.plist")
  }
}
// swiftlint:enable identifier_name line_length type_body_length

//: #### Usage Example

// Access content embedded inline in Swift
let region = PlistFilesInline.Info.cfBundleDevelopmentRegion
let fabricKits = PlistFilesInline.Info.fabric["Kits"]
let options = PlistFilesInline.Configuration.options

// Or access content by loading Plist files at runtime
let style = PlistFilesRuntime.Info.uiMainStoryboardFile
let items = PlistFilesRuntime.ShoppingList.items
